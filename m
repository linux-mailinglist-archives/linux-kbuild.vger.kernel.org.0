Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF78729620
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jun 2023 11:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241300AbjFIJ7C (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jun 2023 05:59:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241413AbjFIJ6I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jun 2023 05:58:08 -0400
Received: from sonic303-20.consmr.mail.sg3.yahoo.com (sonic303-20.consmr.mail.sg3.yahoo.com [106.10.242.37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3B44EEB
        for <linux-kbuild@vger.kernel.org>; Fri,  9 Jun 2023 02:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1686304237; bh=9nzxW6B/MvFhAP50ZbSiMFWUt0MzxUGDbu3YVmfcIxw=; h=Date:From:Reply-To:To:In-Reply-To:References:Subject:From:Subject:Reply-To; b=l732Kgw3EbFpq/Pu06+k9m4EjVoW1v+s1/LgDmMOmoSml1ZmF5lxgSWhIWdyZBP3kqcDhoBS/UrGLtXPosx4RcDXZ3HSP37/zHjDIpTFV6ak8HQXDXTNJJQ6KD/UDZF9mc4SUreYwDF6Ue9PkxSxeBVrtTRy2BGyjkCLDze/uG/wM+NOz6Gd2E7swkyfugcPrVhI9VA0vjM7UjR4SjVv/djLnNg61jECO7YKReEXAlNagf16Ed1ZlesHK47+OMsS5xpQnY9D7CodaoY0PvcyhkTesWNXsurNwDUF7fY3arM6ypHNzhCIUJfzBinELamE0NTJhroEvOhLHXcdNMcWWQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1686304237; bh=P+YJ3QyJrAA9FG4mDiD1DyTl8WeLkk3nLQEd3itbQqh=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=TzNHa0siP+RXMYf8LSWOBdMLnipfT5Tqo4CTJJwWwwX5JlPvATBUMOMv8SjZ29T8h0QwuL3xoVDdehnbzHGrU4BQBvNGL9wqvVNmHTz77p7kBxZhUpmUu0/VpiW3tvXJMQXcgNRq1tjSEUtVMHCDLZyh7G193X0Ag9O1cT6PccDssiZW4PPI1xZikq8YtfLXGn1fFH1C/dOpFMT5wCSRy9UC95KLhlhh8Kb7ZHrELKCsFAZ/r/8okKj1WQJv75p7oJ4WPz/PTG3PHV2dpukZw2qWa+DyC1pfhYspvwUPVBfxYUP4pQ5w/k+5bi+9OlqKblUwIXVZlXuy+UGnzV4HCQ==
X-YMail-OSG: o4As8.MVM1lPG9QjPmcqlU0.W1jiNZZIZUoOlkhWYEmzAAOSEWyDHzTbBU42rKA
 T2r8l_TXJJzbiYkbs4iwxajn02J3B83ua93B3VNvbnT7_gNcVEBdrOuyHkdjSmN2Af_kSgFtqowR
 7F_5kh0IWdSVnqe0JCkaoIJ7ZqM4C14JUROcEXYH3ZcpD1tlgqXe7x.0H3m5gCNYIecNkTCVSs_z
 a2zT0x8SAQZAxOU5p0GY2avADdO8fDwe1bUuCRoYrdFyHp743V1NtxNIBSR7Rd7N2pzkMl89UIQ9
 MRHycds3UzsHp6xLI._ar3wkIuUe7M84fQqIZKNxCSrs8f3vO9ZxV0m8ZV7fn8KsuvkJzOWIvNc4
 JgwAHJTftFaF90KQo5L0dt.OgGOSn2bdaNUPR0cX1.7Z6meBLNAUGCmFQNEmJrPEK4CMjQeHboyu
 tPkOQkEMDZWnzRYOU6xhISMo6VZcbD5O1gmPt.GDWX0RgPI6i33qvzfeCkNWZzDqcv02z1rXCtuB
 Spd7rKav1lfqNVcKozFkO.EqkI74hiF1jn0LPy3TMzuqpXtXbp6BliyiXctAA.mDcjh_H05Dgc9m
 lcRCC4mOt7KM256P1fhcOGwCWmMbuXnE.RKhSyUOwls8HYNauJeOj89gvle3p7S2qNankPwRjU0d
 PFzWHtZKllU0wIIcfzBE7wffIay06.83V7KE2BT3x.MHx9fMkdWvm1Ppdu5zAZIs70b6q9VhJevp
 JMiB2hyX4Uz9XEeZkeCVtalh2QsIQEoi5M9OZTDPcKA5YM7OJ2ez1GgCoUW1dHkWzwU_Qq4ia99G
 sqkxCytvP4Li6HWeldxIA2KDdRfmj8zF6m1NZA8SaeJwjv8Mseg27A8uVrGoyxC6PMp_tD9MN3WV
 ixPxE8Y0NqQDIWPj8exGMFcSU0PxaaJwyrwI6EXPeguuVWI_1DBRQ.03tKEbMaA1wwQBnqVOEGZ.
 309KDKkkgiaqMojbT_z7YNGvj4u58pSr8A3giyzVnb9kKRA9kHSWzMZoRz9Sdba4m_lZkz4P.AM_
 CxrJPt91J1bA5szWZXHfLtBPfHFXRyZG__tAu64zZ.SaH6hoNbgxnZ7kz3uMJGDJ0_z4mTmLd8T8
 lfhsv5avpZRmM6OeRp1PgRNu13xZvpf0p.MiPPHePWGGY9OMpz1mDFL2bQ5IZELCCtKDgFmAD2MA
 26een6J0uGkNHDJL4kCjT5kkveQ78sOOmi_RVgNajPWVNLQA0B0YPJiqAjv6SkEicguN6fF.3Fxp
 H3MC.MvUCx.fZfloF_4S1sA_YP1eVF_.A4xKOjgR1YGCM0oqOfWfx67bWqaYgXAKAC22QUN_LCvo
 779qmZ57Ygt0JlGflLJCHC_r_WIHQyrFMFn2dHgRe58h2jotnGw7B7mN3Ea9DFBk0Feyk2oZjcXU
 D6V8SKgC0dC_9uefC3ATlwFHnFPAfTO8c9aF8jXaas1E6sEUZnI5YCjrzweRkq_JElGcIM1Lk67s
 EN4w_lfD7ujYMs9vK7ZxFz0Jdz748GaN.NU8rHYezsAW9UDko0EHGPNbcUYBtYgETWAyfehTQFcI
 uPbviJbkG8TBEh4Rfzb0Sh0SmSmGRbDbTl7o58cB_ui4wqvwzKY1W1FG.fkK5KuflASaVKd1NvvZ
 hvvW_fF7WUCNTLv2sjZeAlfZ5OqR78AYhNkekRLGZrshOapGVfqg6ePeM82s_hyPUQ._drI2V1iY
 pWouoaE5n7_.jxJyopURezLjqFAI5yx4tqMgimy9LGi_yo36FObfX9xJQpeGzl_uSSlvNedkdzxr
 oRwuuzeq6iQDFb8MSaDA2KlHOisIohm9OoyifyDOmeKvlkOr2yRqMp5knQXrdrJntzR_bgGq6PVD
 OJCZ1DT.7p6cy30vN06pWIMXNUVofuz6H9wAsI07XLvh7XFaFFKP2MD6jlradvCvly9zVL6dyBHs
 uqbl.Ukh6VUG7Rc3RDwBMiEEN2TLuy4XlUQS4XiUZKrKQPZYJJDXd_X6iY2ivWg6AIGJKvaLrY98
 8u20_Tv6DAqrkSRXR7hFfl.Gd8GUis3ABL6YMqZfAXug9xOdsBVpPFUPU0W4jweEcaKrw8LJVUHS
 zUPKWyr.uT2_F7msZs.GAgog6UUM7Ul6rXbJ0HMMOkWeS9scban1pdX5h8wJv9rICIMCwnU.VXxC
 6GC73ayarDtrrSSgLKudknEDGo2bfOwQ4k4ticqcgcOHg3Oh_jThRNfx2eMh33uRSMLL41PnuPRm
 geqieTP5dywlA.9WFj37_sg8EEchLLwfYd7ShYg0ZpByTqJxY9R9Xb8YCBPY0j3zraRuZblqZe3v
 3.juUHE5rfOHcNPOvPs2_KA--
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: 7999d4f3-0f2b-4434-addf-82a91b47a7b1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.sg3.yahoo.com with HTTP; Fri, 9 Jun 2023 09:50:37 +0000
Date:   Fri, 9 Jun 2023 09:50:32 +0000 (UTC)
From:   P J P <pjp@fedoraproject.org>
Reply-To: P J P <pj.pandit@yahoo.co.in>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Message-ID: <1289987364.1419400.1686304232810@mail.yahoo.com>
In-Reply-To: <1912422946.266461.1686045667325@mail.yahoo.com>
References: <1912422946.266461.1686045667325.ref@mail.yahoo.com> <1912422946.266461.1686045667325@mail.yahoo.com>
Subject: Re: About Kconfig tree
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.21516 YMailNorrin
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FORGED_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_NEUTRAL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Masahiro,


* I've been reading linux/scripts/kconfig sources and trying to understand =
how it works. I'm wondering if we can read Kconfig sources and build a tree=
/graph structure in memory, which can then be traversed by a user.


* Is there any code/library under scripts/kconfig/ directory which creates =
such tree/graph data-structure from kconfig source files? Which can be reus=
ed? OR we'll have to write such a code from scratch?


* I'd appreciate your inputs/comments to confirm the same? And any guidance=
 if we have to write code to create such data-structure.


Thank you.
---
=C2=A0 -Prasad
