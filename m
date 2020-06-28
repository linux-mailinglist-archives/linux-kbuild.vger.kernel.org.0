Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 923E620C7D3
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Jun 2020 14:18:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgF1MSa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Jun 2020 08:18:30 -0400
Received: from mout.web.de ([217.72.192.78]:55449 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726250AbgF1MSa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Jun 2020 08:18:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
        s=dbaedf251592; t=1593346703;
        bh=zUPzMZfZvkkDhdKPlTQ5hjBU1MqvHKi9Zqx9vf1H5TM=;
        h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
        b=L1D9jDfIWSF5iLfpv0pONFmRQudt4iTkmablIrSmXNM3OxRMOZhxPOJOfKwvThGwi
         TtkVTQ3xrVGc+6c7z9dweErIUEASKtgWYSkvq2sekbJs1JzhQWuZLMbmzLaXEZSTta
         1keBiQB+mUcNr+NMf9LcGB4aw+wZNDxZ8+FrIZAE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([2.244.52.166]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M73WL-1iveSQ0cLd-00wpWv; Sun, 28
 Jun 2020 14:18:23 +0200
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH] kconfig: qconf: Fix find on split mode
From:   Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <9048b1ca-87aa-dfee-2be3-2f399d2b7fe6@web.de>
Date:   Sun, 28 Jun 2020 14:18:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ShA9GLipEFEA+AXkaXlRHcmkJCpRKI7fPGKud4xvipMpWpXR/xv
 hqb5wbMnAzGQ7QmbMnaI5Z19iivxnbM7lVw/d6p17DTa/m5NUNkQq/N2ZmnTEzaWZ+JDtD9
 jxP0vvByxwM490WnrumbIImCIvnhtDlVFXH+WKhvQasLA/ChTWckjntKluDaeyugHk8CWK0
 UJy4cdCbn5YrMT9oIZ9Uw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yN64QDTkQzA=:37KK6KXl8pWMOoKtBPTdgU
 jnZXXDFT3pu7TTeAekS6Q4QZ2umE69TOR/xXSS5wvRhrXgu9H6YvuttuoRiW3ZQH/ureyJoO5
 /OChVluNfd41YkdGFGh2fLIIwsX6ESsGetioNgIc6zKoMn+ygKwACwIPXf/BF1xH1+Nu4dg/o
 1r1pXp0PeznxzrjXWcHgNzcYM5XNH0bKYJvEXMKw5CEU4e8nbWKe4PnYiAgJjT0wyd6ysCDxw
 9X2GnKypozLk4XCYn+PN2KSG77Gu07QXC81C1PN9khaii/6D5deUe9ESZiax6a6wtnQkwURQj
 qA5F/vnkeg/gvztKK030IYEXc22quigtSbIHKj1ShqWu2mAZfv+gZsfz0sCQFLiXX8KRMxyKA
 VLrtq19BKEYBZrPVVQDKNkiYrAn1T551xs0ND30NsruaTlOl0pXLIcLDJ1pfX2xuSZk+LqYU+
 R2F0+HwXCPVtE05e62djGon0RIrh4z0ducFx3vr+H3Z4wXifERRY6M5Pn3iLP3j5+SQCG8NX2
 1vW7Uc3Vvu5xPzF7AafrsXQUDwS3g0f4JkICTqSqMmghnA/cV+FbDltzknbk8vxkAbW8vFvk9
 BqQGJTgt+NKqfTIqMm/E2cfum/tsIT985qCBQdxVrHrAtZUHuxOZlwy3RPnFjRaUU3pLP0Zac
 TbeOR+UuGXFJvA8p8ZeUor6dgr3wTc35/MTCTZvlxnhhewe3J2PoIjFJ0M6oxrysggSMlizmD
 iER9TD2fs/JstmO+0wM7O10REv+WVxfuunky+NaECeoA1id5K/cxWyrfiXm3fUlBuPCXpccI+
 RhNV4Mg83tR6rEjGH+NLbIQGlc0rLv4x9qEC0jN/8DLG2MbMCXUpZKQfukBcOR7GIYoXofJmw
 fyIgMtHkzi0HYkG0IEs4NF0PJdB0D0KIAK2aaGBX0BF+DmCYQIlx4k1JiL99XYeBTq1kF1Lp8
 NT7yzhyYgF1f+noGrL3LYZFpebk7H7cBNJtndESAAsL/Y1nEfdqdG8TUKsfgh1+CyzO4bgqNg
 m46M6L3WMqYzh8EobWZaA2a31TVjzp7RLoIMZE/J1ZVgl2J/CPuc/7zbr72pfhU/gGcMxRgea
 0rsYByuXVvlLLbFia5g26rzYO3tuEcBSlS1slXiom8uPZmqbmSoRXvLIkfj0G0JH15dqhWDES
 OIr+AA4RRNWpEocu1OoOVOdF2TmQJNRXdXQ/ZcsIrVlzj33QxosZwiXupBmSBtvrTnrDKBYEX
 lQBVeGEExT20G5NIX
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> The logic handling find on split mode is currently broken.

* Is there a word missing in this change description?

* Can any information become clearer another bit?


> Fix it, =E2=80=A6

Please replace the beginning of this sentence with the tag =E2=80=9CFixes=
=E2=80=9D.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?id=3D719fdd32921fb7e3208db8832d=
32ae1c2d68900f#n183

Regards,
Markus
