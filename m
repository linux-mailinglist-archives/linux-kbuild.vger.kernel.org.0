Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 02764AC959
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Sep 2019 23:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406283AbfIGVIW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Sep 2019 17:08:22 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36148 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727467AbfIGVIW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Sep 2019 17:08:22 -0400
Received: by mail-lj1-f193.google.com with SMTP id l20so9153470ljj.3;
        Sat, 07 Sep 2019 14:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7p6Mkwi8jPdC84liskcX2qQwFroVmsh1A1rK00DXSks=;
        b=kmRGyr9MYo8cy8gopztfcoajVSZVBX7QajsZi/7v5mzhMDl1Aiswjo/IFFwqlmguPd
         bttG71LOGpBRiuieX9BkIHlaWkIHAXJ96VMJmDMHvM5TsD92Kzt1y4vAH93+Ll1zMz3h
         0o/Gqk/rJRU3/qyh9SqIg+LP4BNCEJmkRbt6mDBstaHpSOOhUNWX3bybFnn9GyemX0WR
         jj5XoOICpTvDM41T75xZRRlX9KW1ArCS6rEFxgWvDxUhHrsT2wuDjSpNAlPC50oUVzzu
         Y23DLKtdTfs+UuTCeJ85zG5uUCUe0gnt5zom09cVDiDBEC92L9bgnSbdQtjhWa4Juy8H
         Q7Ww==
X-Gm-Message-State: APjAAAUF1WHmHo2SNGsWdo7uYZ4RTue4qiLbFhLpCc+3ZY5mZMd0uLPm
        ZuFnYz3qTD6LePPHPmwAp4aa7Juc
X-Google-Smtp-Source: APXvYqz/NmOOdgdrVIowmSKYH7GmkmZ4I4/x7k+JKza60QVoHDRFTAuTG5GRNh9rfNVC9PtOhEBwMw==
X-Received: by 2002:a2e:9a54:: with SMTP id k20mr3407321ljj.14.1567890499955;
        Sat, 07 Sep 2019 14:08:19 -0700 (PDT)
Received: from [192.168.1.8] ([31.173.86.136])
        by smtp.gmail.com with ESMTPSA id w18sm981784lji.94.2019.09.07.14.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Sep 2019 14:08:19 -0700 (PDT)
Subject: Re: [PATCH] mostpost: don't warn about symbols from another file
To:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Emil Velikov <emil.l.velikov@gmail.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        WANG Chao <chao.wang@ucloud.cn>,
        Sami Tolvanen <samitolvanen@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190906151059.1077708-1-arnd@arndb.de>
From:   Denis Efremov <efremov@linux.com>
Message-ID: <aa79df36-8698-3490-ef7f-f9c6a90c34c6@linux.com>
Date:   Sun, 8 Sep 2019 00:08:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <20190906151059.1077708-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 06.09.2019 18:10, Arnd Bergmann wrote:
> On architectures such as ARM that have a list of symbols exported
> from assembler in a separate C file, we get a lot of new warnings:
> 
> WARNING: "__ashrdi3" [vmlinux] is a static (unknown) WARNING:
> "__lshrdi3" [vmlinux] is a static (unknown) WARNING: "__aeabi_llsr"
> [vmlinux] is a static (unknown) WARNING: "__aeabi_lasr" [vmlinux] is
> a static (unknown) WARNING: "__aeabi_uidivmod" [vmlinux] is a static
> (unknown) WARNING: "__udivsi3" [vmlinux] is a static (unknown) 
> WARNING: "_change_bit" [vmlinux] is a static (unknown) WARNING:
> "__aeabi_idiv" [vmlinux] is a static (unknown) WARNING: "__umodsi3"
> [vmlinux] is a static (unknown) WARNING: "__aeabi_uidiv" [vmlinux] is
> a static (unknown) WARNING: "__aeabi_idivmod" [vmlinux] is a static
> (unknown) WARNING: "__muldi3" [vmlinux] is a static (unknown) 
> WARNING: "__aeabi_ulcmp" [vmlinux] is a static (unknown) WARNING:
> "__raw_writesb" [vmlinux] is a static (unknown) WARNING:
> "__raw_readsb" [vmlinux] is a static (unknown) ...
> 
> This is not helpful, as these are clearly not static symbols at all.
> Suppress the warning in a case like this.
> 
> Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL*
> functions") Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Tested-by: Denis Efremov <efremov@linux.com>

What I could add here is that all these symbols are:
$ nm vmlinux | grep '__ashrdi3\|__lshrdi3\|__aeabi_llsr\|...'
cd63c845 A __crc___aeabi_lasr
76cf47f6 A __crc___aeabi_llsl
8a4fa83b A __crc___aeabi_llsr
44643b93 A __crc___aeabi_lmul
f564412a A __crc___aeabi_ulcmp
40f07981 A __crc___ashldi3
edd9106d A __crc___ashrdi3
389ecf9e A __crc___bswapdi2
f1ea6f1c A __crc___bswapsi2
14d4a9c5 A __crc__change_bit
ff67b37f A __crc___lshrdi3
800e4ffa A __crc___muldi3
f7163ec9 A __crc___raw_readsb
f0ed2ef4 A __crc___raw_writesb
ffb94ef0 A __crc__test_and_change_bit
7cc035a7 A __crc___ucmpdi2

There is no ksymtab, kstrtab for them and there is
no the exact symbols, only crc.

Thus they get to the symbolhash table from
handle_modversions() -> sym_update_crc().

Since there is no the exact symbols, e.g. like
nm vmlinux | grep __kmalloc
2d6fcc06 A __crc___kmalloc
c01c922d T __kmalloc           <---
c0749192 r __kstrtab___kmalloc
c073c7c4 r __ksymtab___kmalloc

we can't check them in this cycle:
// check for static EXPORT_SYMBOL_* functions && global vars
for (sym = info.symtab_start; sym < info.symtab_stop; sym++) {

and they are automatically marked as static.

That's all so far, I don't know is it correct to have only
__crc* or not for a symbol.

Just a sidenote:
arch/arm/kernel/armksyms.c states that these are
/*
 * libgcc functions - functions that are used internally by the
 * compiler...


Thanks,
Denis

> --- scripts/mod/modpost.c | 2 +- 1 file changed, 1 insertion(+), 1
> deletion(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c index
> 76c221dd9b2b..4265dd924933 100644 --- a/scripts/mod/modpost.c +++
> b/scripts/mod/modpost.c @@ -2543,7 +2543,7 @@ int main(int argc, char
> **argv) struct symbol *s = symbolhash[n];
> 
> while (s) { -			if (s->is_static) +			if (s->is_static && s->export
> != export_unknown) warn("\"%s\" [%s] is a static %s\n", s->name,
> s->module->name, export_str(s->export));
> 
