Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DE6CE118A
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2019 07:23:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389186AbfJWFW7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 23 Oct 2019 01:22:59 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:35379 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728697AbfJWFW7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 23 Oct 2019 01:22:59 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x9N5MnFA005835
        for <linux-kbuild@vger.kernel.org>; Wed, 23 Oct 2019 14:22:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x9N5MnFA005835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571808169;
        bh=sz3FwFsIH16G5U1Cw/zmd455VoYGbx6i7WIRXV7aHhs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=lU09WuxXGMMrpHgwbZ99fv4r8bC40fgEffNKkP+w736/iRbnaSHl2HpklKWi79u0Z
         3m9BQFH2GMXlJNWQth3W1aKk4thNVv/Yl0J33AyKijLIwkejQLe7iMZBi6lic7Ljv+
         YixGr2cAmyPFWyEN5D8YWbk1h0WEGrfQ2u33AmbHLCAIbORtqxEBPXK+fWbWCCQQAn
         k1nI6QIDsAX2Hf3gC+e1pWB3vRPQJQX8k0EMlP0xrwjHCjjSvizzXlB6x++SrDvLng
         p9fJUgjf8TkYCDV2k4SN3T73CKJOfW9OFclCDzGWRvXw/U3HNXWbeWAzFjPln16XMR
         8+9a1I5MYvkmw==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id l13so5639637uap.8
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Oct 2019 22:22:49 -0700 (PDT)
X-Gm-Message-State: APjAAAXlDH+KPzxoHBxvUj5XAQSs5uOZ+2MoNDmSCHXDXXLHRGTo90k5
        Zg+cT1/+AuPKxT9/Lm9FxtkQ+8uvoDyJEsahung=
X-Google-Smtp-Source: APXvYqzm8yUb7rzPN+z1OPNpZoa4h9sdDAf3UyM1GPij7BtLhv5d59F7laqdWPjwFTnS6gXn7uBfKmrVfjw7aMIrei4=
X-Received: by 2002:a9f:3e81:: with SMTP id x1mr4436308uai.121.1571808168530;
 Tue, 22 Oct 2019 22:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <20191003031312.157994411@gmail.com> <20191003031312.252507322@gmail.com>
In-Reply-To: <20191003031312.252507322@gmail.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 23 Oct 2019 14:22:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQzY6LgYyJLS7jxpksi4R-v+kVLESdDzM5Xijxw5oFBUg@mail.gmail.com>
Message-ID: <CAK7LNAQzY6LgYyJLS7jxpksi4R-v+kVLESdDzM5Xijxw5oFBUg@mail.gmail.com>
Subject: Re: [PATCH 1/4] scripts: namespace.pl: handle lib-ksyms.o as lib.a
To:     rd.dunlab@gmail.com
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Randy,

On Thu, Oct 3, 2019 at 12:18 PM <rd.dunlab@gmail.com> wrote:


> In scripts/Makefile.build, any resulting lib-ksyms.o file is renamed to
> lib.a, so handle that rename here also.

This description is incorrect.
lib-ksyms.o is included in built-in.a


The code attempts to suppress the warnings
in a strange way.


I think the following is a more straightforward way.


diff --git a/scripts/namespace.pl b/scripts/namespace.pl
index 4a545ba868f8..f0c94333a23d 100755
--- a/scripts/namespace.pl
+++ b/scripts/namespace.pl
@@ -166,6 +166,7 @@ sub linux_objects
        if (/.*\.o$/ &&
                ! (
                m:/built-in.a$:
+               || m:/lib-ksyms.o$:
                || m:arch/x86/vdso/:
                || m:arch/x86/boot/:
                || m:arch/ia64/ia32/ia32.o$:





--
Best Regards
Masahiro Yamada
