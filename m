Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20BA1791DE
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2019 19:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbfG2RSF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 29 Jul 2019 13:18:05 -0400
Received: from esgaroth.petrovitsch.at ([78.47.184.11]:2450 "EHLO
        esgaroth.tuxoid.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726601AbfG2RSF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 29 Jul 2019 13:18:05 -0400
X-Greylist: delayed 676 seconds by postgrey-1.27 at vger.kernel.org; Mon, 29 Jul 2019 13:18:04 EDT
Received: from [10.68.100.236] (h10-gesig.woeg.acw.at [217.116.178.11] (may be forged))
        (authenticated bits=0)
        by esgaroth.tuxoid.at (8.15.2/8.15.2) with ESMTPSA id x6TH6LuC020471
        (version=TLSv1 cipher=AES128-SHA bits=128 verify=NO);
        Mon, 29 Jul 2019 19:06:22 +0200
Subject: Re: kbuild: Fail if gold linker is detected
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Ingo Molnar <mingo@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
        "H.J. Lu" <hjl.tools@gmail.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org
References: <alpine.DEB.2.21.1907161434260.1767@nanos.tec.linutronix.de>
 <20190716144034.GA36330@gmail.com>
 <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
From:   Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Message-ID: <77140de3-84de-dc5a-c82d-60432145fec2@petrovitsch.priv.at>
Date:   Mon, 29 Jul 2019 19:06:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1907161757490.1767@nanos.tec.linutronix.de>
Content-Type: multipart/mixed;
 boundary="------------46ACFD3E755ACF77140A0DD2"
Content-Language: en-US
X-DCC-URT-Metrics: esgaroth.tuxoid.at 1060; Body=8 Fuz1=8 Fuz2=8
X-Virus-Scanned: clamav-milter 0.97 at esgaroth.tuxoid.at
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED
        autolearn=unavailable version=3.3.1
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on esgaroth.tuxoid.at
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------46ACFD3E755ACF77140A0DD2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all!

On 16/07/2019 17:59, Thomas Gleixner wrote:
[...]
> No. It fails randomly, but also predictable. Enable X32 support on 64bi=
t
> and it fails the VDSO build. That's been the case for years.

FWIW "GNU gold (GNU Binutils for Ubuntu 2.30) 1.15" segfaults for
userspace x32 binaries now and then (in unpredictable ways) too.

MfG,
	Bernd--
"I dislike type abstraction if it has no real reason. And saving
on typing is not a good reason - if your typing speed is the main
issue when you're coding, you're doing something seriously wrong."
    - Linus Torvalds

--------------46ACFD3E755ACF77140A0DD2
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D=3D
=3DGX6K
-----END PGP PUBLIC KEY BLOCK-----

--------------46ACFD3E755ACF77140A0DD2--
