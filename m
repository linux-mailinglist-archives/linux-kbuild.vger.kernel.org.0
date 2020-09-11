Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B34926562F
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Sep 2020 02:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725300AbgIKAxK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Sep 2020 20:53:10 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:40178 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgIKAxD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Sep 2020 20:53:03 -0400
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 08B0qWaU016272;
        Fri, 11 Sep 2020 09:52:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 08B0qWaU016272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1599785553;
        bh=zR+S14upFtFOfYPUnpRmVuladH4fF61qNnf8hM0w8cs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XZDKfqhBSc/ufwda5luc/TcXqUt4YwjHmK+Asaz/AXKmzEL2JeUYk1PI9jPFYoCch
         Q1Nfi5IIDbZwbCcdtoh0Ma5cj0Zg/x4eKCK8gpfU8hCQe9IwSshij390sz7mFZkcNk
         8rfL8rLEPapwZR0lReg5XDlSntHBwrRm5bSmf0TuqqacasH3mKn/EdrKIPMaDn270L
         hSMw/ypEJ4gkyyacORlsa1WyiID7XVnFvdK3+BYUI9vXdDiIeVooqnKtqzY7byTNgu
         pTteEOhQYO8XUhE0Fu2Qls5L3KsptnG5bw7udytmAstXzOnLbQU4vCCv+qnyJFVqLU
         Wyr/pTxPGRObw==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id 34so5318852pgo.13;
        Thu, 10 Sep 2020 17:52:33 -0700 (PDT)
X-Gm-Message-State: AOAM5323OIIC5RN89HlEYdp3+L8jHcgV7Yed2MAUbi8lgTIthw8ebp2x
        aBaRuFvk5bbgIX/20i+ODrVlZV9Iy8WTzbgxVOI=
X-Google-Smtp-Source: ABdhPJzvuLZtVu9LNMQjm3fBTqkQtWKUuSYNipEe+AEFkVMtCATxVYlKpfmWBJi8iWR3f7eJG/jXfrRIZRPU2Q149xI=
X-Received: by 2002:a17:902:ac8b:b029:d0:89f4:6220 with SMTP id
 h11-20020a170902ac8bb02900d089f46220mr8372616plr.8.1599785552176; Thu, 10 Sep
 2020 17:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200910180352.12632-1-willy@infradead.org>
In-Reply-To: <20200910180352.12632-1-willy@infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 11 Sep 2020 09:51:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNASr2M=Y8ZZ2KCVJd1uFe9oNyb_TnTwTubiQDtZtp6vqfg@mail.gmail.com>
Message-ID: <CAK7LNASr2M=Y8ZZ2KCVJd1uFe9oNyb_TnTwTubiQDtZtp6vqfg@mail.gmail.com>
Subject: Re: [PATCH] build: Fix documentation checking
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 11, 2020 at 3:04 AM Matthew Wilcox (Oracle)
<willy@infradead.org> wrote:
>
> Using $(call cmd,...) requires that there be a quiet_ version of the
> command, otherwise it's silently skipped.


quiet_ is not required to run the command.
It is just a matter of making the short-log visible.

For example, we cmd_objtool,
but not quiet_cmd_objtool.


> Fixes: 3a2429e1faf4 ("kbuild: change if_changed_rule for multi-line recip=
e")
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  scripts/Makefile.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)




The doc check is working for me.



For example,

"make -j24   allyesconfig   security/apparmor/  W=3D1"
showed the following for me.


  CC      security/apparmor/label.o
  CC      security/apparmor/mount.o
  GEN     security/apparmor/net_names.h
  CC      security/apparmor/crypto.o
  CC      security/apparmor/capability.o
  GEN     security/apparmor/net_names.h
  CC      security/apparmor/resource.o
  CC      security/apparmor/net.o
security/apparmor/procattr.c:32: warning: duplicate section name 'Return'
security/apparmor/procattr.c:34: warning: Function parameter or member
'label' not described in 'aa_getprocattr'
security/apparmor/procattr.c:34: warning: Excess function parameter
'profile' description in 'aa_getprocattr'
security/apparmor/match.c:148: warning: Function parameter or member
'tables' not described in 'verify_table_headers'
security/apparmor/match.c:289: warning: Function parameter or member
'kref' not described in 'aa_dfa_free_kref'
security/apparmor/match.c:289: warning: Excess function parameter 'kr'
description in 'aa_dfa_free_kref'
In file included from security/apparmor/policy_unpack.c:1237:
security/apparmor/policy_unpack_test.c:51:16: warning: no previous
prototype for =E2=80=98build_aa_ext_struct=E2=80=99 [-Wmissing-prototypes]
   51 | struct aa_ext *build_aa_ext_struct(struct policy_unpack_fixture *pu=
f,
      |                ^~~~~~~~~~~~~~~~~~~
security/apparmor/secid.c:56: warning: Cannot understand  *
 on line 56 - I thought it was a doc line
security/apparmor/audit.c:107: warning: Function parameter or member
'type' not described in 'aa_audit_msg'
security/apparmor/capability.c:45: warning: Function parameter or
member 'ab' not described in 'audit_cb'
security/apparmor/capability.c:45: warning: Function parameter or
member 'va' not described in 'audit_cb'
security/apparmor/lib.c:75: warning: Function parameter or member 'n'
not described in 'skipn_spaces'
security/apparmor/lib.c:349: warning: Function parameter or member
'accum' not described in 'aa_perms_accum_raw'
security/apparmor/lib.c:349: warning: Function parameter or member
'addend' not described in 'aa_perms_accum_raw'
security/apparmor/lib.c:368: warning: Function parameter or member
'accum' not described in 'aa_perms_accum'
security/apparmor/lib.c:368: warning: Function parameter or member
'addend' not described in 'aa_perms_accum'
security/apparmor/lib.c:432: warning: Excess function parameter 'deny'
description in 'aa_check_perms'
security/apparmor/policy_ns.c:62: warning: Function parameter or
member 'curr' not described in 'aa_ns_name'
security/apparmor/policy_ns.c:62: warning: Function parameter or
member 'view' not described in 'aa_ns_name'
security/apparmor/policy_ns.c:62: warning: Function parameter or
member 'subns' not described in 'aa_ns_name'
security/apparmor/policy_ns.c:201: warning: Function parameter or
member 'view' not described in '__aa_lookupn_ns'
security/apparmor/policy_ns.c:201: warning: Excess function parameter
'base' description in '__aa_lookupn_ns'
security/apparmor/resource.c:55: warning: Function parameter or member
'peer' not described in 'audit_resource'
security/apparmor/resource.c:55: warning: Function parameter or member
'info' not described in 'audit_resource'
security/apparmor/resource.c:106: warning: Function parameter or
member 'label' not described in 'aa_task_setrlimit'
security/apparmor/resource.c:106: warning: Function parameter or
member 'task' not described in 'aa_task_setrlimit'
security/apparmor/resource.c:106: warning: Function parameter or
member 'resource' not described in 'aa_task_setrlimit'
security/apparmor/resource.c:106: warning: Function parameter or
member 'new_rlim' not described in 'aa_task_setrlimit'
security/apparmor/file.c:258: warning: Function parameter or member
'start' not described in 'aa_str_perms'
security/apparmor/file.c:258: warning: Excess function parameter
'state' description in 'aa_str_perms'
security/apparmor/policy.c:259: warning: Function parameter or member
'proxy' not described in 'aa_alloc_profile'
security/apparmor/policy.c:644: warning: Function parameter or member
'ns' not described in 'policy_view_capable'
security/apparmor/policy.c:682: warning: Function parameter or member
'ns' not described in 'aa_may_manage_policy'
security/apparmor/policy.c:682: warning: Function parameter or member
'mask' not described in 'aa_may_manage_policy'
security/apparmor/policy.c:682: warning: Excess function parameter
'op' description in 'aa_may_manage_policy'
security/apparmor/policy.c:742: warning: Excess function parameter
'share_proxy' description in '__replace_profile'
security/apparmor/policy.c:800: warning: Function parameter or member
'ns' not described in '__lookup_replace'
security/apparmor/policy.c:800: warning: Function parameter or member
'hname' not described in '__lookup_replace'
security/apparmor/policy.c:800: warning: Function parameter or member
'noreplace' not described in '__lookup_replace'
security/apparmor/policy.c:800: warning: Function parameter or member
'p' not described in '__lookup_replace'
security/apparmor/policy.c:800: warning: Function parameter or member
'info' not described in '__lookup_replace'
security/apparmor/mount.c:320: warning: Function parameter or member
'devname' not described in 'match_mnt_path_str'
security/apparmor/mount.c:320: warning: Excess function parameter
'devnme' description in 'match_mnt_path_str'
security/apparmor/mount.c:376: warning: Function parameter or member
'path' not described in 'match_mnt'
security/apparmor/mount.c:376: warning: Excess function parameter
'mntpath' description in 'match_mnt'
security/apparmor/label.c:166: warning: Function parameter or member
'an' not described in 'vec_cmp'
security/apparmor/label.c:166: warning: Function parameter or member
'b' not described in 'vec_cmp'
security/apparmor/label.c:166: warning: Function parameter or member
'bn' not described in 'vec_cmp'
security/apparmor/label.c:166: warning: Excess function parameter
'vec' description in 'vec_cmp'
security/apparmor/label.c:166: warning: Excess function parameter 'n'
description in 'vec_cmp'
security/apparmor/label.c:263: warning: Function parameter or member
'flags' not described in 'aa_vec_unique'
security/apparmor/label.c:592: warning: Function parameter or member
'label' not described in '__label_remove'
security/apparmor/label.c:592: warning: Excess function parameter 'l'
description in '__label_remove'
security/apparmor/label.c:927: warning: Function parameter or member
'ls' not described in 'aa_label_insert'
security/apparmor/label.c:927: warning: Function parameter or member
'label' not described in 'aa_label_insert'
security/apparmor/label.c:1220: warning: Excess function parameter
'ls' description in 'aa_label_merge'
security/apparmor/label.c:1305: warning: Function parameter or member
'state' not described in 'label_compound_match'
security/apparmor/label.c:1305: warning: Excess function parameter
'start' description in 'label_compound_match'
security/apparmor/label.c:2050: warning: Function parameter or member
'label' not described in '__label_update'
security/apparmor/policy_unpack.c:675: warning: Function parameter or
member 'ns_name' not described in 'unpack_profile'
security/apparmor/lsm.c:773: warning: Function parameter or member
'sk' not described in 'apparmor_sk_alloc_security'
security/apparmor/lsm.c:773: warning: Function parameter or member
'family' not described in 'apparmor_sk_alloc_security'
security/apparmor/lsm.c:773: warning: Function parameter or member
'flags' not described in 'apparmor_sk_alloc_security'
security/apparmor/lsm.c:789: warning: Function parameter or member
'sk' not described in 'apparmor_sk_free_security'
security/apparmor/lsm.c:803: warning: Function parameter or member
'sk' not described in 'apparmor_sk_clone_security'
security/apparmor/lsm.c:803: warning: Function parameter or member
'newsk' not described in 'apparmor_sk_clone_security'
security/apparmor/lsm.c:820: warning: Function parameter or member
'family' not described in 'apparmor_socket_create'
security/apparmor/lsm.c:820: warning: Function parameter or member
'type' not described in 'apparmor_socket_create'
security/apparmor/lsm.c:820: warning: Function parameter or member
'protocol' not described in 'apparmor_socket_create'
security/apparmor/lsm.c:820: warning: Function parameter or member
'kern' not described in 'apparmor_socket_create'
security/apparmor/lsm.c:849: warning: Function parameter or member
'sock' not described in 'apparmor_socket_post_create'
security/apparmor/lsm.c:849: warning: Function parameter or member
'family' not described in 'apparmor_socket_post_create'
security/apparmor/lsm.c:849: warning: Function parameter or member
'type' not described in 'apparmor_socket_post_create'
security/apparmor/lsm.c:849: warning: Function parameter or member
'protocol' not described in 'apparmor_socket_post_create'
security/apparmor/lsm.c:849: warning: Function parameter or member
'kern' not described in 'apparmor_socket_post_create'
security/apparmor/lsm.c:876: warning: Function parameter or member
'sock' not described in 'apparmor_socket_bind'
security/apparmor/lsm.c:876: warning: Function parameter or member
'address' not described in 'apparmor_socket_bind'
security/apparmor/lsm.c:876: warning: Function parameter or member
'addrlen' not described in 'apparmor_socket_bind'
security/apparmor/lsm.c:892: warning: Function parameter or member
'sock' not described in 'apparmor_socket_connect'
security/apparmor/lsm.c:892: warning: Function parameter or member
'address' not described in 'apparmor_socket_connect'
security/apparmor/lsm.c:892: warning: Function parameter or member
'addrlen' not described in 'apparmor_socket_connect'
security/apparmor/lsm.c:907: warning: Function parameter or member
'sock' not described in 'apparmor_socket_listen'
security/apparmor/lsm.c:907: warning: Function parameter or member
'backlog' not described in 'apparmor_socket_listen'
security/apparmor/lsm.c:924: warning: Function parameter or member
'sock' not described in 'apparmor_socket_accept'
security/apparmor/lsm.c:924: warning: Function parameter or member
'newsock' not described in 'apparmor_socket_accept'
security/apparmor/lsm.c:953: warning: Function parameter or member
'sock' not described in 'apparmor_socket_sendmsg'
security/apparmor/lsm.c:953: warning: Function parameter or member
'msg' not described in 'apparmor_socket_sendmsg'
security/apparmor/lsm.c:953: warning: Function parameter or member
'size' not described in 'apparmor_socket_sendmsg'
security/apparmor/lsm.c:962: warning: Function parameter or member
'sock' not described in 'apparmor_socket_recvmsg'
security/apparmor/lsm.c:962: warning: Function parameter or member
'msg' not described in 'apparmor_socket_recvmsg'
security/apparmor/lsm.c:962: warning: Function parameter or member
'size' not described in 'apparmor_socket_recvmsg'
security/apparmor/lsm.c:962: warning: Function parameter or member
'flags' not described in 'apparmor_socket_recvmsg'
security/apparmor/lsm.c:982: warning: Function parameter or member
'sock' not described in 'apparmor_socket_getsockname'
security/apparmor/lsm.c:990: warning: Function parameter or member
'sock' not described in 'apparmor_socket_getpeername'
security/apparmor/lsm.c:1012: warning: Function parameter or member
'sock' not described in 'apparmor_socket_getsockopt'
security/apparmor/lsm.c:1012: warning: Function parameter or member
'level' not described in 'apparmor_socket_getsockopt'
security/apparmor/lsm.c:1012: warning: Function parameter or member
'optname' not described in 'apparmor_socket_getsockopt'
security/apparmor/lsm.c:1022: warning: Function parameter or member
'sock' not described in 'apparmor_socket_setsockopt'
security/apparmor/lsm.c:1022: warning: Function parameter or member
'level' not described in 'apparmor_socket_setsockopt'
security/apparmor/lsm.c:1022: warning: Function parameter or member
'optname' not described in 'apparmor_socket_setsockopt'
security/apparmor/lsm.c:1031: warning: Function parameter or member
'sock' not described in 'apparmor_socket_shutdown'
security/apparmor/lsm.c:1031: warning: Function parameter or member
'how' not described in 'apparmor_socket_shutdown'
security/apparmor/lsm.c:1045: warning: Function parameter or member
'sk' not described in 'apparmor_socket_sock_rcv_skb'
security/apparmor/lsm.c:1045: warning: Function parameter or member
'skb' not described in 'apparmor_socket_sock_rcv_skb'
security/apparmor/lsm.c:1076: warning: Function parameter or member
'sock' not described in 'apparmor_socket_getpeersec_stream'
security/apparmor/lsm.c:1076: warning: Function parameter or member
'optval' not described in 'apparmor_socket_getpeersec_stream'
security/apparmor/lsm.c:1076: warning: Function parameter or member
'optlen' not described in 'apparmor_socket_getpeersec_stream'
security/apparmor/lsm.c:1076: warning: Function parameter or member
'len' not described in 'apparmor_socket_getpeersec_stream'
security/apparmor/domain.c:136: warning: Function parameter or member
'state' not described in 'label_compound_match'
security/apparmor/domain.c:136: warning: Excess function parameter
'start' description in 'label_compound_match'
security/apparmor/domain.c:290: warning: Function parameter or member
'perms' not described in 'change_profile_perms'
security/apparmor/domain.c:389: warning: Function parameter or member
'bprm' not described in 'find_attach'
security/apparmor/domain.c:389: warning: Function parameter or member
'head' not described in 'find_attach'
security/apparmor/domain.c:389: warning: Function parameter or member
'name' not described in 'find_attach'
security/apparmor/domain.c:389: warning: Function parameter or member
'info' not described in 'find_attach'
security/apparmor/domain.c:560: warning: Function parameter or member
'info' not described in 'x_to_label'
security/apparmor/domain.c:1292: warning: Excess function parameter
'onexec' description in 'aa_change_profile'
security/apparmor/apparmorfs.c:1500: warning: Cannot understand  *
 on line 1500 - I thought it was a doc line
security/apparmor/apparmorfs.c:1527: warning: Cannot understand  *
 on line 1527 - I thought it was a doc line
security/apparmor/apparmorfs.c:1884: warning: Cannot understand  *
 on line 1884 - I thought it was a doc line
security/apparmor/apparmorfs.c:2127: warning: Function parameter or
member 'p' not described in '__next_profile'
security/apparmor/apparmorfs.c:2127: warning: Excess function
parameter 'profile' description in '__next_profile'
  AR      security/apparmor/built-in.a







> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index a467b9323442..571d75777b6f 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -104,7 +104,8 @@ else ifeq ($(KBUILD_CHECKSRC),2)
>  endif
>
>  ifneq ($(KBUILD_EXTRA_WARN),)
> -  cmd_checkdoc =3D $(srctree)/scripts/kernel-doc -none $<
> +  quiet_cmd_checkdoc =3D CHKDOC  $<
> +        cmd_checkdoc =3D $(srctree)/scripts/kernel-doc -none $<
>  endif
>
>  # Compile C sources (.c)
> --
> 2.28.0
>


--=20
Best Regards
Masahiro Yamada
