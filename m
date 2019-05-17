Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78FF82193E
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 15:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728508AbfEQNhY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 09:37:24 -0400
Received: from esgaroth.petrovitsch.at ([78.47.184.11]:2261 "EHLO
        esgaroth.tuxoid.at" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728333AbfEQNhX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 09:37:23 -0400
Received: from [10.68.100.236] (h10-gesig.woeg.acw.at [217.116.178.11] (may be forged))
        (authenticated bits=0)
        by esgaroth.tuxoid.at (8.15.2/8.15.2) with ESMTPSA id x4HDZoC0031977
        (version=TLSv1 cipher=AES128-SHA bits=128 verify=NO);
        Fri, 17 May 2019 15:35:50 +0200
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
To:     Alexander Kapshuk <alexander.kapshuk@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
 <CAJ1xhMUxsFR6yLeV1rG1FRZzqwyMGF5PURk6F5_6kN3v2dGN1A@mail.gmail.com>
 <68270a84-966b-05e3-c82e-893c320febfd@petrovitsch.priv.at>
 <CAJ1xhMVaeQPoW1v91bcNOkw1FJOr7ddhDc-ir=3AiKRCSzCj=g@mail.gmail.com>
From:   Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Message-ID: <781705f7-61c8-3af9-1a0a-df2b6d078b77@petrovitsch.priv.at>
Date:   Fri, 17 May 2019 15:35:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAJ1xhMVaeQPoW1v91bcNOkw1FJOr7ddhDc-ir=3AiKRCSzCj=g@mail.gmail.com>
Content-Type: multipart/mixed;
 boundary="------------684266AF469CFF47027062F7"
Content-Language: en-US
X-DCC-debian-Metrics: esgaroth.tuxoid.at 1169; Body=15 Fuz1=15 Fuz2=15
X-Virus-Scanned: clamav-milter 0.97 at esgaroth.tuxoid.at
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.5 required=5.0 tests=ALL_TRUSTED,AWL
        autolearn=unavailable version=3.3.1
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
        *  0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on esgaroth.tuxoid.at
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is a multi-part message in MIME format.
--------------684266AF469CFF47027062F7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 17/05/2019 11:25, Alexander Kapshuk wrote:
> On Fri, May 17, 2019 at 11:58 AM Bernd Petrovitsch
> <bernd@petrovitsch.priv.at> wrote:
>>
>> On 17/05/2019 10:16, Alexander Kapshuk wrote:
>> [...]
>>> The 'xargs' '-r' flag is a GNU extension.
>>> If POSIX compliance is important here, the use of 'cat', 'xargs' and
>>> 'basename' may be substituted with that of 'sed' to initialise
>>> same_name_modules:
>>> sed 's!.*/!!' modules.order modules.builtin | sort | uniq -d
>>
>> 's!' is TTBOMK also a GNU-extension:
>> sed 's/.*\///' modules.order modules.builtin | sort | uniq -d
>=20
> It isn't.
> Here's an excerpt from the POSIX manpage for 'sed',
> http://pubs.opengroup.org/onlinepubs/009695399/utilities/sed.html:
> [2addr]s/BRE/replacement/flags
> ...  Any character other than backslash or <newline> can be used
> instead of a slash to delimit the BRE and the replacement....

Oops, yup, sorry for the noise.
Don't know anymore where I encountered problems with that in the past ...=
=2E

MfG,
         Bernd--
"I dislike type abstraction if it has no real reason. And saving
on typing is not a good reason - if your typing speed is the main
issue when you're coding, you're doing something seriously wrong."
    - Linus Torvalds

--------------684266AF469CFF47027062F7
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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3D=3D
=3Dv2Yn
-----END PGP PUBLIC KEY BLOCK-----

--------------684266AF469CFF47027062F7--
