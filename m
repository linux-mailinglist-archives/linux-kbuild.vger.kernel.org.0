Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 91454151E4F
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2020 17:29:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbgBDQ3V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 4 Feb 2020 11:29:21 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38078 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgBDQ3U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 4 Feb 2020 11:29:20 -0500
Received: by mail-qk1-f195.google.com with SMTP id 21so1431318qki.5;
        Tue, 04 Feb 2020 08:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VZqxpmTLq7ANIHnvv08b9chlQb5uC3TxYbMtrp/5w/o=;
        b=P7mC3YM7jj2f3uNL632XGxBaFJJoe0ox5kkHZscoXgKtvKasu0s6SLFHyY8s+P8fmY
         ipfpYQE4vICNNdNe31JjXaxmFzQrQGyy9Le9fpIsB4jI3doRTLqxhwBSjL4q55bslykQ
         Jb6rAYUbQ7+PNDdntPG6PsUh+qcIc0Czq825LlDuj6J8UnXcT1iqQ6T6NneFYiWduYvd
         UPGIGnbQbYhqMkzzqz3lltKABNKIN1Sa0Gijnbrh6+GOPf+65KqOqsoY3y6Iwy0AOl2o
         XKkvZ/Re1uk3p6T1qJ9LImqdjCW9iDKWjCajN54KxLqmIYnWVV6gN4inySNvW2BXXEuV
         L+HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:date:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=VZqxpmTLq7ANIHnvv08b9chlQb5uC3TxYbMtrp/5w/o=;
        b=rafAfEWcde6/YAv2m3PbTAaBhzCscYozFPYyiDWqq6CooqlMhed3EF2C4nl59V76fR
         4JJGDmLBHzmY4UH00MNTspn5aBdbpSoTUI9dYqoPZe8yF28MWS5bfcFOlgItA8lBwV4S
         e8jR5aSjVu436EVATfaE1JLRPUO4WZCzaAP4GHkn6RykrEO4eHpZYLm+CtGUd+Cv8DaT
         mJzGGoe13fDulOhV67tYuIFUqUACW8jqOA2d4STPbtYlkCoC2Sb9TPqP/Waa439nEnQO
         uVJsLLf8DTSIM4VFm6KaKCfddHOR6BBwSSjfLJQkwZHosZjPidhMEP0qHHLADyA2lfha
         IKNA==
X-Gm-Message-State: APjAAAUPx5nUgusikNNMrYKsRL1PgLp7XiEp5LsbB9lLi2sPiiXK+xwF
        zGix2NAXF1sF5CSXo+QjUDk=
X-Google-Smtp-Source: APXvYqxGCq/00mpT8oEFtbR3y+FwAI8o4XxX+HqIN4I8TuP7bhFs05wjJkEcL3lgRs4M3OZRRyKBwA==
X-Received: by 2002:a05:620a:16a4:: with SMTP id s4mr28708125qkj.488.1580833759694;
        Tue, 04 Feb 2020 08:29:19 -0800 (PST)
Received: from rani.riverdale.lan ([2001:470:1f07:5f3::b55f])
        by smtp.gmail.com with ESMTPSA id w134sm11606629qka.127.2020.02.04.08.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2020 08:29:19 -0800 (PST)
From:   Arvind Sankar <nivedita@alum.mit.edu>
X-Google-Original-From: Arvind Sankar <arvind@rani.riverdale.lan>
Date:   Tue, 4 Feb 2020 11:29:17 -0500
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Thelen <gthelen@google.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] initramfs: don't double-compress built-in initramfs if
 the kernel is compressed
Message-ID: <20200204162917.GA1772390@rani.riverdale.lan>
References: <20200203200656.GA455151@rani.riverdale.lan>
 <20200203211644.39847-1-nivedita@alum.mit.edu>
 <CAK7LNAQq7ah1yLOr-fgH-Oo7_NHzvYiy6huY1=4DxJoCGi+cmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAK7LNAQq7ah1yLOr-fgH-Oo7_NHzvYiy6huY1=4DxJoCGi+cmw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 04, 2020 at 11:22:19AM +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Tue, Feb 4, 2020 at 6:16 AM Arvind Sankar <nivedita@alum.mit.edu> wrote:
> >
> > If the kernel is going to be compressed anyway, there is no point in
> > double-compressing the built-in initramfs. Hide the built-in initramfs
> > compression choice in this case.
> >
> > Signed-off-by: Arvind Sankar <nivedita@alum.mit.edu>
> 
> 
> Double-compression slightly reduces the data size.
> And, keeping the bare vmlinux small is beneficial, IMHO.
> 

Ok. In my setup (kernel is compressed by xz), none for the builtin
initramfs is optimal by a measurable amount, but I that will depend on
config/initramfs contents/compression methods, so might well not be true
in general. Maybe add a note to the help text?

none    7030816 arch/x86/boot/bzImage
gz      7382144 arch/x86/boot/bzImage
bz2     7353696 arch/x86/boot/bzImage
lzma    7118176 arch/x86/boot/bzImage
xz      7126400 arch/x86/boot/bzImage
lzo     7379360 arch/x86/boot/bzImage
lz4     7335712 arch/x86/boot/bzImage


diff --git a/usr/Kconfig b/usr/Kconfig
index a6b68503d177..b68910b225fc 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -125,6 +125,12 @@ choice
 	  low on RAM, since it reduces the memory consumption during
 	  boot.
 
+	  Note that if the kernel itself is compressed, the builtin initramfs
+	  will be compressed twice, first by the algorithm selected here, and
+	  then by the kernel compression method chosen. This may increase the
+	  final image size, so you should test whether compressing the builtin
+	  initramfs provides any savings.
+
 	  Keep in mind that your build system needs to provide the appropriate
 	  compression tool to compress the generated initram cpio file for
 	  embedding.
