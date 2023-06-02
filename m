Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0998D71FE0A
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Jun 2023 11:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234304AbjFBJin (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 2 Jun 2023 05:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234563AbjFBJin (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 2 Jun 2023 05:38:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0B9C0
        for <linux-kbuild@vger.kernel.org>; Fri,  2 Jun 2023 02:38:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC8B160AFA
        for <linux-kbuild@vger.kernel.org>; Fri,  2 Jun 2023 09:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C80C433D2
        for <linux-kbuild@vger.kernel.org>; Fri,  2 Jun 2023 09:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685698720;
        bh=Vqi/MACemCggxlqO17uN6VZlX/q7HkWg0XU5JvIeJSw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N4rrAHSe51CFm9uHpfyFRCT8wZXuLk+w08qgTDN32MYanLpQvf6hZ+cEYOoYO6mFM
         htnG9FFD6DpqnyJFYyi9gSiu3vCEJ9OJrmZnKZs5LLz3fTJuBXqJrTPX1Aw4Yd+POO
         pGkELke8I4UNEtvqpO1C5TvPpfpF4ThImXFLt1JTOo5edUEe7LpktXcPcIjIP2OqQM
         ryr4QYSoFGxv/1dI5W70FxtQQ0DCXQL4gj6UGzBqTtvgya0GMBS/i48zIl5KivBTGV
         L1NuOLnILG7ibBTYfcBk76PJFeb0uaLdcPCZwbuvfCZzi82wpnxVSNT6hui2wulS0x
         L1BEz1fIUCgcQ==
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5559cd68b67so1326282eaf.3
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Jun 2023 02:38:40 -0700 (PDT)
X-Gm-Message-State: AC+VfDwRXLGUtZa42v1ZjGkVay2PpADgaPmAlRIPAeRbYpP+GbHFOn8B
        tjqpWBMQNdN61zBU8/hbuKHrXOJy00gfvfWkBWE=
X-Google-Smtp-Source: ACHHUZ6NI6W/9hWUScOKBzEJwOuBknqklyXwSSIHNUrud+dR00zUFqycmoVyD2S8wu5pB96JOHzmx8gYv5op43LjpKM=
X-Received: by 2002:a05:6808:5cd:b0:399:b7bd:903c with SMTP id
 d13-20020a05680805cd00b00399b7bd903cmr1817547oij.40.1685698719453; Fri, 02
 Jun 2023 02:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <TYCP286MB2066DEF0E1810E8BC36F533EC07B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
 <OSZP286MB20611C35BF36F4EB69FD3DF6C0469@OSZP286MB2061.JPNP286.PROD.OUTLOOK.COM>
 <CAK7LNATz8xDmf5SuApGnrbkxvWPJNG1HTuQSrw2v_Ox5sXQO2A@mail.gmail.com> <TYCP286MB2066563135B12E064AA59976C04B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
In-Reply-To: <TYCP286MB2066563135B12E064AA59976C04B9@TYCP286MB2066.JPNP286.PROD.OUTLOOK.COM>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 2 Jun 2023 18:38:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR1m2_mjRMp0nk+7CQUCefPdY-+rAZo4SNBAL5C+MJVNQ@mail.gmail.com>
Message-ID: <CAK7LNAR1m2_mjRMp0nk+7CQUCefPdY-+rAZo4SNBAL5C+MJVNQ@mail.gmail.com>
Subject: Re: [PATCH v2] gen_compile_commands: include targets not ending with .o
To:     =?UTF-8?B?6IOh546u5paH?= <huww98@outlook.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 30, 2023 at 6:04=E2=80=AFPM =E8=83=A1=E7=8E=AE=E6=96=87 <huww98=
@outlook.com> wrote:
>
> On Mon, May 29, 2023 at 07:13:46PM +0900, Masahiro Yamada wrote:
> > On Thu, May 25, 2023 at 9:21=E2=80=AFPM Hu Weiwen <huww98@outlook.com> =
wrote:
> > >
> > > Currently, we only extract commands for targets ending with '.o'. But=
 we
> > > also have many standalone executables built in-tree.
> > >
> > > Remove this restriction. And to avoid some false matching, exclude
> > > targets end with '.c' or '.h' when directly walking the directory.
> >
> >
> > Can you give me some examples of false matching?
>
> Examples:
> - drivers/scsi/scsi_devinfo_tbl.c: generated by
>   sed -n 's/.*define *BLIST_\\([A-Z0-9_]*\\) *.*/BLIST_FLAG_NAME(\\1),/p'=
 include/scsi/scsi_devinfo.h > drivers/scsi/scsi_devinfo_tbl.c
>
> - arch/x86/entry/vdso/vdso-image-32.c: generated by
>   arch/x86/entry/vdso/vdso2c arch/x86/entry/vdso/vdso32.so.dbg arch/x86/e=
ntry/vdso/vdso32.so arch/x86/entry/vdso/vdso-image-32.c
>
> I think only .c file targets would have false matching, because the cmd
> must ends with '.c' to be matched.

I see.


>
> >
> > Also, this patch would pick up *.i, *.s, *.lst, etc.
> >
> > Does it make sense to parse cmd files for those?
> > I guess the answer is no.
>
> We are already parsing cmd files for those before this patch.

True, but they are excluded by _LINE_PATTERN.


> I use more
> strict `_FILENAME_PATTERN'. But it may be hard to exclude all of these
> by filename.

I think so.


> Should we use a more strict `_LINE_PATTERN'? e.g., require the cmd to
> begin with a compiler, not `sed' or something else. But we don't know
> the compiler name, adding a parameter for compiler name may break the
> existing usage.


Standalone executables are host programs.
I do not think it is worthwhile complicating the code.




--=20
Best Regards
Masahiro Yamada
