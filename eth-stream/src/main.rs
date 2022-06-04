// #[tokio::main]
// async fn main() -> web3::Result<()> {
//     let transport = web3::transports::Http::new("https://main-light.eth.linkpool.io")?;
//     let web3 = web3::Web3::new(transport);
//
//     println!("Calling accounts.");
//     web3.eth().
//     let mut accounts = web3.eth().accounts().await?;
//     println!("Accounts: {:?}", accounts);
//     accounts.push("00a329c0648769a73afac7f9381e08fb43dbea72".parse().unwrap());
//
//     println!("Calling balance.");
//     for account in accounts {
//         let balance = web3.eth().balance(account, None).await?;
//         println!("Balance of {:?}: {}", account, balance);
//     }
//
//     Ok(())
// }


// use hex_literal::hex;

// #[tokio::main]
// async fn main() -> web3::Result<()> {
//     // let _ = env_logger::try_init();
//     let transport = web3::transports::WebSocket::new("wss://main-light.eth.linkpool.io/ws").await?;
//     let web3 = web3::Web3::new(transport);
//
//     println!("Calling accounts.");
//     let mut accounts = web3.eth().accounts().await?;
//     println!("Accounts: {:?}", accounts);
//     // accounts.push(hex!("00a329c0648769a73afac7f9381e08fb43dbea72").into());
//
//     println!("Calling balance.");
//     for account in accounts {
//         let balance = web3.eth().balance(account, None).await?;
//         println!("Balance of {:?}: {}", account, balance);
//     }
//
//     Ok(())
// }


use web3::futures::{future, StreamExt};

#[tokio::main]
async fn main() -> web3::Result {
    let ws = web3::transports::WebSocket::new("wss://main-light.eth.linkpool.io/ws").await?;
    let web3 = web3::Web3::new(ws);
    let mut sub = web3.eth_subscribe().subscribe_new_heads().await?;
    (&mut sub)
        .take(100)
        .for_each(|x| {
            println!("Got: {:?}", x.unwrap());
            future::ready(())
        })
        .await;

    Ok(())
}
