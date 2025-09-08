read -p "Did you sync fork on GitHub? (y/N): " answer

if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
	echo "Pulling from personal repo..."
	git pull
fi
