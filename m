Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A72172BA01
	for <lists+linux-kbuild@lfdr.de>; Mon, 12 Jun 2023 10:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjFLIPX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Jun 2023 04:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbjFLIPC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2023 04:15:02 -0400
Received: from sonic308-19.consmr.mail.sg3.yahoo.com (sonic308-19.consmr.mail.sg3.yahoo.com [106.10.241.209])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD6631BC6
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2023 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1686557661; bh=oykZWX4LsH+hbI3j3e8fsJdv+iYunj+d5g5mPcpdehI=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=PmdkYlUWIXssymQzwu79vircHPKqUt+LXP/Thp03TMw1UJrftoZZLSfLdpGZbn49H7UqBkDjKDXfG510bLKMdW/yl/Ys+SzAbDcR6tZNiRwFj+mM6NKgCn7+v2Rr1TP9ejvsD1hZQGXqFiSudUjJJcSuvdYa+1KOR/X45ELABndQIxx/MGtcjh5mC6dKKvEgVm6AQCGfIoBju2aF66ZxEtpwZEQc9gSOgQOCBTpAjWAwgt7e5vEHJK57yirVj1rhDkmwYtttxQeSXOBw7q+u/kqTpXk+DIG0fg7L/b5qTVP4HGAh3RIgvABu2iiufzlQci/4g+ZaYU94WydvbrVpvg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1686557661; bh=cbkkmxKPfgXAcz0oyaHEz8DQBXXyePpYUfGCOpqXG4d=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=T/3AEYSFvintcShMolHQ4A9W255EChb/2/FcOxF7xTUtfaIux7jAufmuDKo9ItWUkwsdas1gsuxenYK3Bj5hHdd69atyWAvJ/Y4qlDmOTY0CKfTbn13loPhLEWTUbvi3tnzWAmJLzt61YWiDY+nZh+zVQHpJCuKnBFClSl1VlKnSMDERYgsiq/uXEZdvaAz7VpkDdBjKURUu+K4ToS/rvwkOi6TAg97Dl4HqkUj41lPN6WKLQXdygBPxvjgC54NRGW7+/Nh9iHBRzrrS5PJxRnsDnjS22BNqGVe78D2VRW3B53YuOB9ZvmxHo503BuF8cgXs6k0OT7MN8d93IffGQQ==
X-YMail-OSG: rDoqn1sVM1noEe0iNLF2TDPj.jDijwLIAf6Ez7qV.OtL213oOwQrfZ4YuPeIbMp
 j94BMXEIuUeoh3l95JOBSzDi9wwU4FOSca5zaIUVuBhpDzlpiBYz65EN3fM0T6_jsOgJ86E.4pU3
 BjYgR1TO8fjzMkbMCfyQnNcGPFOS7jHVN8w4DVUAGBq4Ji4EwGbz2ROX3o7pQPyKVn4VDM.DvC0N
 rCDO4glnkAKUf6zWh_aDmuLaZW_5RmV6N6hP2JIyU_BFgPhDye4a6hD0s1aYI5T9t10Fz_aCBtyq
 IM1XOrOOTyww.XtSiT4X8qaMgMZl81xwZ3K2pn0n4w8.ZpRSBjADafnh7lx0IAUAm8RE2XC96Px.
 6zwVQ3JQNmCXBenpQfdQYhznY5_Pu40192i2xxPrqsTWdJs0sTXghBB4IQmHPRMRR75Meng2F1C0
 fYamPhn.erSYl9C.xPuhvpEeCCc826Dp9Qb9MjvFD4N6zwl0_qQ7ysg_vTXV5KD4H2lKIzjR8NkX
 1U65onQ1KXfBKC2CWxmJyH5GxPoIKNA.FqndckTs5_7BAE8NynPCh1_ifOAgtET5XF6jJpJ4nDBk
 3sUwXy1VbsxKymxvLq5FVid7bp_yaUwVQ6vK7JPNc0NuGB.p5J6TshjHMhY6q2dcUk1ml.vje43S
 aHlbelNBMTFAD9D8fQSsNIUkfPf1ZhR7Vep90cN6.A75L50oazn9miQrPkVntLKqx52p5F_JzloV
 0FCQhbUOmDJ5zrKzP0lnlpgwf78LwrPw.6kmMFeE3lLOn3VEpYfl_KqzJUAy3GB2W1pVpxlRxheK
 FauEfBnrMaxX7psf2dMHr3_sdr2gUgW2vqFvv721KhVZIXdj0FCGGSW6Nv9jajRB7d.wuTU5XhbN
 2zuWnOgBQC_mv4MfaGN9lY7uB3OEyLY1cPbKANb8pEZyUiaqpAUgdK0zppK1Rqt2joEf3eYAqByp
 SqSq8CsvbnV9XakLpkfAfFBeSn2D3qRKbUpX2HsQYpDx7NDqKLUxGbICAoDjjcJLUCzyKOEm1loZ
 iz9030aOP3RCZiyrtWY8nrLrIq7KBkIWWsRXwN.1wtWgYe_v7I8u5_A1P7Qn.yk209MT4FtwcUkS
 LUZadFoyHCU3NTK3C0MCBj4zx_8WtiqNPy_8Gw6TZYKEJxfiwXVp5bXTFX2xZ1zTa093HLJidJ8Q
 Fg7rgDFTVQYkX4NxUrj0FJuBdDFJ7HI7UWomrdSFv5fsG1y0tmjAsxDQCZ2By6zjmDsaJLgfR_dQ
 MDwRJygpoIlunuZagsnWWQo5YiCf.I1wHxHcPzCNI_6aKw.UVvUd_gcgXcNKHqyV8K4gG_23L3Nl
 jOXNCObR3O7Ianykux0Hb2zPsiZASDhthuaqnHXFmokUlRycHJUbizsj2hlQp00stSNCgOT5Aut9
 DSbPcGIfkOGqwkbX9uQtVo4NlmrCR5rz.MNAZLlv6sVITwYbi9s3b6DQ0tynCnXn.chOHS2jtThN
 RKf4VTS2.PdwwRCVrmRzyQOgSQtoGP_UdoTKi_4aXYtH9_cKwUjaTWCj50Ia3ZC5_5xCCvbAnxKE
 iMXXCmqQraTVPIF4_QUgdmSVuwqou0dqTWPEQCQy6rHhmpTCcXJYIJBmUYyyNqZrKi3d5_XaDvjq
 FsEFg9YrgSYyfM9RBlm8WjAzQPAT.VBVspU.HOtkqb064Q5jz5MPqWdkA9rmjpFuAMUV7CTm3mrZ
 2TLl7K4YJ5fXboditeoSJMGmtCZRf.W6XsCX8Wz9yhn3P05O4.NrBW5WB40oSzFF_b6Ob63XlWIR
 Z3wta3PZ6tMIl40.lWPDvOgh0u_sxdxymjVR38nolboHrWtc112sYTJdnmqfpLMOflKolVJwZ4Gz
 nFX1fZ1YM4hp8xa_dN5tNxvsLw8NJkydRUjuXfdsxDVKiJqHOZRwbT.12CKF5MjrkwnWUQEa3SHp
 gLZYc5t_Ob1ibnYLCz44pMzdbJ6gNdF48TWknQs1BfNx0fj5wcyzUqrBCTNcOdjwdTzqNG1cTGw0
 AhZHdfAbztTZYD7zJbbMiJ_vDs3FxFApW4qntip.iPPOOiX63SHaxnza0VpMdKfq1TRpZptuaG5Q
 yJdWkWyeVhBqoW8kQiyQBy68ybSZvp_QYAIAP_CwKotL5UK6REPA6yvFilHoUAwHm6FLyrlk6ldk
 em9awVWZsOMsSVWor.cNNhT17zJL._PATdr98UQ8wxxjpQzR1.odLv3IYAIjLU14Ku8U.D.qLPoc
 PZb9uZr9I5z3kNZ7tHTqFuBcxD9TALpMxBlw9Lsx4WmfJ.qDK6UI2AujNCY7sgd7cesWarqidLDy
 VWExHe81AcJ2_FKtGLy5wTg--
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: a3c238c2-f9ab-444d-ad17-2b4470f6de92
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.sg3.yahoo.com with HTTP; Mon, 12 Jun 2023 08:14:21 +0000
Date:   Mon, 12 Jun 2023 08:03:48 +0000 (UTC)
From:   P J P <pjp@fedoraproject.org>
Reply-To: P J P <pj.pandit@yahoo.co.in>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Message-ID: <909309952.1964856.1686557028397@mail.yahoo.com>
In-Reply-To: <CAK7LNAQJh98XhY_hSaojM6mwF3Cvk9o+dLvd0FurYyNV=v2AsA@mail.gmail.com>
References: <1912422946.266461.1686045667325.ref@mail.yahoo.com> <1912422946.266461.1686045667325@mail.yahoo.com> <1289987364.1419400.1686304232810@mail.yahoo.com> <CAK7LNAQJh98XhY_hSaojM6mwF3Cvk9o+dLvd0FurYyNV=v2AsA@mail.gmail.com>
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

On Saturday, 10 June, 2023 at 01:13:38 pm IST, Masahiro Yamada <masahiroy@k=
ernel.org> wrote:
>'common-objs' in scripts/kconfig/Makefile is the core code.
>It is not written in a separate library with user APIs.

* I see, okay, will check common-objs.

Thank you.
---
=C2=A0 -Prasad
