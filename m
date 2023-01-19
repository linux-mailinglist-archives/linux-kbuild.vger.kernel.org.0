Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 678386732FC
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Jan 2023 08:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjASHy0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Jan 2023 02:54:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbjASHxm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Jan 2023 02:53:42 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D14367789
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jan 2023 23:53:31 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id y19so1246841ljq.7
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Jan 2023 23:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=thzaSj8c+BWl0+5AAxILqJerwBuN0JArHjCtb2mc4/Y=;
        b=WzemAcIz+0fW/9RmStSE+lWQe8MwtM2WaSvjM3cZDaHslMPkEdnfQcO6JF+x/7cs9R
         9mangy/bvz1DK0UNfBZOpV/Sk5j+XUXTCPg8Hzu13CJKHNGcz9qTjXLSeTN7MqkTfS2x
         hbvfIzGHb8QfdoYVL3HjM8pHydu0bw9CLOEaEdUscnL7bm4xvHgvgsxsFF5g40C/bvPF
         p5A/2oMI7DUM32Hh50TYMGKj5hzTjUiIXPkSZNWQvmviD2GCfVEJMB0UiKJQk8ZEjCFl
         +fZ5WFknyxeR9Jdl6ODqaLeX8h5Bp7i4F7j9Hw91JiTLsUFPPD7J7sX/ShuXJPOKEC7I
         Q4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:reply-to:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=thzaSj8c+BWl0+5AAxILqJerwBuN0JArHjCtb2mc4/Y=;
        b=bnRs0P5MZU0fbF27Vp37WvsOVaDRSRLXGh5Wawbcv4uy5f6IMg5LypAh3w/6RDMUAG
         9q2w56gu7SKkphw1z3vv+uImVj8js6PG70KKUiahyyXNJwjmgudKTnaH+SYq6Hg/IGdQ
         KrIV73J6CukcRd7PhWUrK1+HdxCKodVMqB/F5LXHh+eeNfHsZnPfrlRwmDh4hLKw80hy
         Lf1awguvDHr5Y6Uca9SDfZ7GCZBjLlwBF/xrCv9ynYpUGP5QxgR2RCrsyb/YRhNMJPQP
         kWb41gkiDWmUPzBSXGg2eokvrUmAJU9+KHbpK3+HLAO3aukzw+KFYUfPtYzKoURPfh4M
         En/Q==
X-Gm-Message-State: AFqh2krZWcA4zWS52YmqrpUwEEP2Yot+jX74DLrkDu/1SzP2OdFA0YaX
        P7PjzrCwA+7wg0gCpVsBxxncFoeSpCUC8Xli/g/1i/vAHYAaVQ==
X-Google-Smtp-Source: AMrXdXtGNQkzVImtrT66gckYDVhA1nYfWsJfG43OF1fAH0VjvM+Da64kA46fWHsjsQO+fLwzOd/1gOf1rR8ZkRrIJ2k=
X-Received: by 2002:a2e:9255:0:b0:289:81a4:3a7b with SMTP id
 v21-20020a2e9255000000b0028981a43a7bmr693205ljg.487.1674114809010; Wed, 18
 Jan 2023 23:53:29 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUV+4QovjQnkAgvon6POgZWstVd-AhZ7OkPU9onuktif1w@mail.gmail.com>
 <CAK7LNATNpKPM2cmrv=NNHDvtMZyxe=u1gfdDyz+uKBRzyjmwxA@mail.gmail.com>
 <CA+icZUXJgR1MFtgpChvwr5iFa_FVr4bEGe3GAM62_3xNSmDeXQ@mail.gmail.com> <CAK7LNARzDnVk7JV6WLRYm54HkY4CVmpcv17YWkr9Q8GT2Epdig@mail.gmail.com>
In-Reply-To: <CAK7LNARzDnVk7JV6WLRYm54HkY4CVmpcv17YWkr9Q8GT2Epdig@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 19 Jan 2023 08:52:51 +0100
Message-ID: <CA+icZUVm7SMUg-TJUCvwLGFVTUSsA9=yk-xVfVf4ksNkioNKuA@mail.gmail.com>
Subject: Re: [6.2-rc4] warning: cannot check the header due to sha1sum missing
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 18, 2023 at 8:51 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Jan 18, 2023 at 4:45 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Mon, Jan 16, 2023 at 4:21 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > >
> > > On Mon, Jan 16, 2023 at 11:02 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > > >
> > > > Hi Masahiro,
> > > >
> > > > I saw these warnings in my build-log:
> > > >
> > > >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > > ::p' include/linux/atomic/
> > > > atomic-arch-fallback.h)" != "$(sed '$d'
> > > > include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
> > > > .*//')" ]; then echo "error: include/linux/atomic/atomic-arch-f
> > > > allback.h has been modified." >&2; exit 1; fi; touch
> > > > .checked-atomic-arch-fallback.h
> > > >  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > > ::p' include/linux/atomic/
> > > > atomic-instrumented.h)" != "$(sed '$d'
> > > > include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
> > > > ]; then echo "error: include/linux/atomic/atomic-instrume
> > > > nted.h has been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
> > > >  if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > > ::p' include/linux/atomic/
> > > > atomic-long.h)" != "$(sed '$d' include/linux/atomic/atomic-long.h |
> > > > sha1sum | sed 's/ .*//')" ]; then echo "error:
> > > > include/linux/atomic/atomic-long.h has been modified
> > > > ." >&2; exit 1; fi; touch .checked-atomic-long.h
> > > >
> > > > NOTE: I did a `make distclean` before I started my build.
> > > >
> > > > Can you please comment on this?
> > >
> > >
> > >
> > >
> > > Please clarify your problem.
> > >
> > > My best guess is, you just added V=1 option to
> > > print the full log, didn't you?
> > >
> > >
> > >
> > > I can see the same build log by running the following command.
> > >
> >
> > Hi Masahiro,
> >
> > you had a chance to look into this?
>
>
> I already replied.
> This is the output of V=1.
> There is no issue.
>

This due to this change?

commit b10fdeea8cf42c0d97b337e9e501c92da4389a03
"kbuild: check sha1sum just once for each atomic header"

$ LC_ALL=C git blame Kbuild | grep 'warning: cannot check the header
due to sha1sum missing'
b10fdeea8cf42 (Masahiro Yamada    2022-08-20 18:15:29 +0900 51)
         echo "warning: cannot check the header due to sha1sum
missing"; \

diff --git a/Kbuild b/Kbuild
index e122d93cee320..0b9e8a16a6212 100644
--- a/Kbuild
+++ b/Kbuild
...
+# Check the manual modification of atomic headers
+
+quiet_cmd_check_sha1 = CHKSHA1 $<
+      cmd_check_sha1 = \
+ if ! command -v sha1sum >/dev/null; then \
+ echo "warning: cannot check the header due to sha1sum missing"; \
+ exit 0; \
+ fi; \
+ if [ "$$(sed -n '$$s:// ::p' $<)" != \
+      "$$(sed '$$d' $< | sha1sum | sed 's/ .*//')" ]; then \
+ echo "error: $< has been modified." >&2; \
+ exit 1; \
+ fi; \
+ touch $@
+
+atomic-checks += $(addprefix $(obj)/.checked-, \
+   atomic-arch-fallback.h \
+   atomic-instrumented.h \
+   atomic-long.h)
+
+targets += $(atomic-checks)
+$(atomic-checks): $(obj)/.checked-%: include/linux/atomic/%  FORCE
+ $(call if_changed,check_sha1)
...

Again, what says my make V=1 log-file:

$ grep warning:
6.2.0-rc4-2-amd64-clang15-kcfi/build-log_6.2.0-rc4-2-amd64-clang15-kcfi.txt

222:  if ! command -v sha1sum >/dev/null; then echo "warning: cannot
check the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n
'$s:// ::p' include/linux/atomic/atomic-arch-fallback.h)" != "$(sed
'$d' include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
.*//')" ]; then echo "error:
include/linux/atomic/atomic-arch-fallback.h has been modified." >&2;
exit 1; fi; touch .checked-atomic-arch-fallback.h

223:  if ! command -v sha1sum >/dev/null; then echo "warning: cannot
check the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n
'$s:// ::p' include/linux/atomic/atomic-instrumented.h)" != "$(sed
'$d' include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/
.*//')" ]; then echo "error:
include/linux/atomic/atomic-instrumented.h has been modified." >&2;
exit 1; fi; touch .checked-atomic-instrumented.h

224:  if ! command -v sha1sum >/dev/null; then echo "warning: cannot
check the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n
'$s:// ::p' include/linux/atomic/atomic-long.h)" != "$(sed '$d'
include/linux/atomic/atomic-long.h | sha1sum | sed 's/ .*//')" ]; then
echo "error: include/linux/atomic/atomic-long.h has been modified."
>&2; exit 1; fi; touch .checked-atomic-long.h

Does it only say I checked the timestamp and thus created
.checked-$atomic-header-file or does it say I have checked the
timestamp and see there were modifications and thus created
.checked-$atomic-header-file?

Thanks.

[1] https://git.kernel.org/linus/b10fdeea8cf42

>
>
>
> >
> > Thanks.
> >
> > Regards,
> > -Sedat-
> >
> > >
> > > $ make V=1 mrproper defconfig  prepare | grep sha1sum
> > > + [ clean = clean ]
> > > + cleanup
> > > + rm -f .btf.*
> > > + rm -f System.map
> > > + rm -f vmlinux
> > > + rm -f vmlinux.map
> > > + exit 0
> > >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > ::p' include/linux/atomic/atomic-arch-fallback.h)" != "$(sed '$d'
> > > include/linux/atomic/atomic-arch-fallback.h | sha1sum | sed 's/
> > > .*//')" ]; then echo "error:
> > > include/linux/atomic/atomic-arch-fallback.h has been modified." >&2;
> > > exit 1; fi; touch .checked-atomic-arch-fallback.h
> > >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > ::p' include/linux/atomic/atomic-instrumented.h)" != "$(sed '$d'
> > > include/linux/atomic/atomic-instrumented.h | sha1sum | sed 's/ .*//')"
> > > ]; then echo "error: include/linux/atomic/atomic-instrumented.h has
> > > been modified." >&2; exit 1; fi; touch .checked-atomic-instrumented.h
> > >   if ! command -v sha1sum >/dev/null; then echo "warning: cannot check
> > > the header due to sha1sum missing"; exit 0; fi; if [ "$(sed -n '$s://
> > > ::p' include/linux/atomic/atomic-long.h)" != "$(sed '$d'
> > > include/linux/atomic/atomic-long.h | sha1sum | sed 's/ .*//')" ]; then
> > > echo "error: include/linux/atomic/atomic-long.h has been modified."
> > > >&2; exit 1; fi; touch .checked-atomic-long.h
> > >
> > >
> > >
> > >
> > >
> > >
> > > >
> > > > Thanks.
> > > >
> > > > Best regards,
> > > > -Sedat-
> > >
> > >
> > >
> > >
> > > --
> > > Best Regards
> > > Masahiro Yamada
>
>
>
> --
> Best Regards
> Masahiro Yamada
