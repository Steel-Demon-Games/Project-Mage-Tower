echo "Adding all files except those in .gitignore"
git add *

read -p "What do you want as your commit message?: " commit_message

while [ "$commit_message" = "" ]; do
	echo "You must input a commit message"
	read -p "What do you want as your commit message?: " commit_message
done

echo "Committing code"
git commit -m $commit_message



echo "Pushing code"
git push

read -p "Did you contribute and make a pull request? (y/N): " answer

if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
	echo "You are done"
else
	echo "Do so and don't forget to write a desciptive pull request. You don't need to run this script again."
fi
