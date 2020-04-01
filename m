Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E42D19A613
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 09:18:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731861AbgDAHSW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 03:18:22 -0400
Received: from tartarus.angband.pl ([54.37.238.230]:45160 "EHLO
        tartarus.angband.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731680AbgDAHSW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 03:18:22 -0400
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.92)
        (envelope-from <kilobyte@angband.pl>)
        id 1jJXdf-0008SI-Nb; Wed, 01 Apr 2020 09:18:15 +0200
Date:   Wed, 1 Apr 2020 09:18:15 +0200
From:   Adam Borowski <kilobyte@angband.pl>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nick Terrell <terrelln@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Chris Mason <clm@fb.com>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
        "x86@kernel.org" <x86@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Patrick Williams <patrickw3@fb.com>,
        Michael van der Westhuizen <rmikey@fb.com>,
        "mingo@kernel.org" <mingo@kernel.org>,
        Patrick Williams <patrick@stwcx.xyz>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and
 initramfs
Message-ID: <20200401071815.GA27371@angband.pl>
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
 <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
 <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 31, 2020 at 05:11:35PM +0200, Sedat Dilek wrote:
> I have re-tested zstd-v3 patchset with Linux version 5.6 final and
> Clang/LLD version 10.0.0 final (from Debian/unstable repository).

So did I and a bunch of other folks.  I for one run v1 since 2017 on
a bunch of boxes (amd64/BIOS, amd64/EFI, arm64, armhf), without a glitch
(not counting trying to boot zstd initrd _without_ the patchset :p).

I've tried v2 on all of the above configurations, v3 on all but armhf, v4 on
amd64/EFI -- all is fine.

Back in the days, folks reported success on IIRC ppc64, sparc64 and more.

(Obviously, initrd only on !x86.)

> Is it possible to mention that there might distro-specific changes
> needed to initramfs-handling?
> For Debian you are welcome to include below Link [1].
> [1] LINK: https://lore.kernel.org/lkml/CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com/

+zstd)  compress="zstd -19 -v" ;;

I'm not sure if hard-coding -19 is always right.  It's good for production
machines but slows down dev cycles.

But that's a matter for userland, not a problem with Nick's patchset.


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀
⣾⠁⢠⠒⠀⣿⡁ in the beginning was the boot and root floppies and they were good.
⢿⡄⠘⠷⠚⠋⠀                                       -- <willmore> on #linux-sunxi
⠈⠳⣄⠀⠀⠀⠀
