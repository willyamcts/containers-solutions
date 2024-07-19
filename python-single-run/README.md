# Descrição / Description

## BR
Exemplo de aplicação que precisa ser executada esporádicamente por rotinas ou agendamentos.
Basta alterar o .py com o conteúdo do script e realizar a criação da imagem e execução, ao finalizar a execução o container é automaticamente deletado. Lembre-se que a imagem deve ser mantida no repositório local ->  `docker image ls` ou é possível criar o container uma única vez removendo o param `--rm` e na rotina de execução apenas iniciá-lo com `docker start python-printers`

## EU
Example of an application that needs to be executed sporadically using routines or schedules.
Just change the .py with the content of the script and create the image and execute it. When the execution ends, the container is automatically deleted. Remember that the image must be kept in the local repository -> `docker image ls` or it is possible to create the container once by removing the `--rm` param and in the execution routine just start it with `docker start python -printers`


# Execute
\# **create image**
```
docker build -t python-app-printers .
```
 

\# **run in crontab/schedule**


```
docker run -q --rm --name python-printers \
  -v <PATH>/containers-solutions/python-single-run/app:/usr/src/counters python-app-printers
```
  Change *\<PATH\>*
