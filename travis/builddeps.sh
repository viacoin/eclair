pushd .
# lightning deps
sudo add-apt-repository -y ppa:chris-lea/libsodium
sudo apt-get update
sudo apt-get install -y libsodium-dev libgmp-dev libsqlite3-dev
cd
git clone https://github.com/luke-jr/libbase58.git
cd libbase58
./autogen.sh && ./configure && make && sudo make install
# lightning
cd
git clone https://github.com/viacoin/lightning.git
cd lightning
git checkout 84f8710a66e04e79b5069502ea1fea61770c3588
git submodule init
git submodule update
make
# bitcoind
cd
wget https://github.com/viacoin/viacoin/releases/download/v0.15.2/viacoin-0.15.2-x86_64-linux-gnu.tar.gz
echo "bdbd432645a8b4baadddb7169ea4bef3d03f80dc2ce53dce5783d8582ac63bab viacoin-0.15.2-x86_64-linux-gnu.tar.gz" > sha256sum.asc
sha256sum -c sha256sum.asc
tar xzvf viacoin-0.15.2-x86_64-linux-gnu.tar.gz
popd

