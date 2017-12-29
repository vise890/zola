_gutenberg() {
    local i cur prev opts cmds
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    cmd=""
    opts=""

    for i in ${COMP_WORDS[@]}
    do
        case "${i}" in
            gutenberg)
                cmd="gutenberg"
                ;;
            
            build)
                cmd+="__build"
                ;;
            help)
                cmd+="__help"
                ;;
            init)
                cmd+="__init"
                ;;
            serve)
                cmd+="__serve"
                ;;
            *)
                ;;
        esac
    done

    case "${cmd}" in
        gutenberg)
            opts=" -c -h -V  --config --help --version   init build serve help"
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 1 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        
        gutenberg__build)
            opts=" -h -V -u -o  --help --version --base-url --output-dir  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                --base-url)
                    COMPREPLY=("<base_url>")
                    return 0
                    ;;
                    -u)
                    COMPREPLY=("<base_url>")
                    return 0
                    ;;
                --output-dir)
                    COMPREPLY=("<output_dir>")
                    return 0
                    ;;
                    -o)
                    COMPREPLY=("<output_dir>")
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        gutenberg__help)
            opts=" -h -V  --help --version  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        gutenberg__init)
            opts=" -h -V  --help --version  <name> "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
        gutenberg__serve)
            opts=" -h -V -i -p -o  --help --version --interface --port --output-dir  "
            if [[ ${cur} == -* || ${COMP_CWORD} -eq 2 ]] ; then
                COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
                return 0
            fi
            case "${prev}" in
                
                --interface)
                    COMPREPLY=("<interface>")
                    return 0
                    ;;
                    -i)
                    COMPREPLY=("<interface>")
                    return 0
                    ;;
                --port)
                    COMPREPLY=("<port>")
                    return 0
                    ;;
                    -p)
                    COMPREPLY=("<port>")
                    return 0
                    ;;
                --output-dir)
                    COMPREPLY=("<output_dir>")
                    return 0
                    ;;
                    -o)
                    COMPREPLY=("<output_dir>")
                    return 0
                    ;;
                *)
                    COMPREPLY=()
                    ;;
            esac
            COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
            return 0
            ;;
    esac
}

complete -F _gutenberg -o bashdefault -o default gutenberg
