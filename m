Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED6C7D2B29
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Oct 2023 09:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233398AbjJWHXK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 23 Oct 2023 03:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229789AbjJWHXK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 Oct 2023 03:23:10 -0400
Received: from sonic306-19.consmr.mail.sg3.yahoo.com (sonic306-19.consmr.mail.sg3.yahoo.com [106.10.241.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2552DD68
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Oct 2023 00:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1698045783; bh=OSmRrDd3oFaPLkNb5EUVbsjRXMkaU8f59+r+U9DfTh8=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=rW6zv+XBcOqz6MdKyvznajEJFZzVGibOPpzuH9nd3TfaD/Wi7N6GKTABGL5cO/Sw1tgeDBWQwy3Aps7LvGtxKkJKM7k50dmsIAnLXDCcxsX7aHCXKNLQLglS/cUAewJSwVhpkFHc6E1jSiWqB0jH2xKWYFE4nW2bGaNK7rU1h1/Dqh1gAtzTdeNvenbWk+4W0bfRlAuQcXWVNXU7CnX5ttb7sM6nJ4hPGAqlsIfKUIRKEt91seTnemleq6TRrnegZTjPd5ner635+ojF1GcfB3eyaT6QzfOHIB/B4rn6hXak0mWts1pPpxfn97ALGUcwIguHSSt7w8Z1oGZeqpybow==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1698045783; bh=1nytl3DXbcmB5THxCbzTqP1PEWekjDPWOXUyFuyD/VU=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=DBaO0U3QwBiZWmgZSdiV6cRvCV4oOLN3+u0jmghZugprr6jZqS49yS8oBdJIIoSA4O4KhHiu47HXKhG1Y84M8sKLsQe+zbdTlBFtEY4fRtKdY8FE6nf8Olz1BYa7N4D849xQUJyF+rHHR/oY405zqQxIIX0W+DfYui0mlJ/eKk5unmBGP0Al/Z7/w7/MJ0hTkVNV4fBCybjX2T9Pgy0WLQUOMjxPZsoxH1CZqZhpZzhTTBHy8lS7SUIR7qb0B5QSp3Kgg9En+vn6MN/pi7ZT4heWUc5fyoCcQFMwJxyE+GfVNaWwLk2P1dcosCOtcjSJiismobXA7xihDT7QvdMUIA==
X-YMail-OSG: D0p1OQMVM1l9lSs_7u9jvuvUPKatEitaomvI55TQ4N5eidLXHJ8r7DWIfaUbEbs
 EgQ.N8p3uhx4xpakAWBC7QdNrZA4.kht9a1xqSKdpZXhPSPX.DbjUggAwBqONZ4en1xBB8dugB9S
 uwEoSANl3cphMkC75ddbgOgYzakyoFP.BsBi8Z9tYqqAMytcQDaRsBaYJhQhl.LsNaOhpghkpE7Y
 R1UEdnu3iDvZ4f2O763BQ_rYUDH.5XApKlHHjyJ4vBv8TnctJRjjC4WkZpUlXEh93fQosnbM4PiQ
 YuFXKc3aoNjln4n0F3BBNGB2gg0gZodW5sTp.sQFWAhxjiIBawioQ8ImGY6nX52NczA6xJq7eNo9
 XO7ChFVvhZNlbCjxLFyWExxajA8LsXyUeU5V6WRjydm_PiXFEH7n7l0CDJ7ILioIAmNJia4dLo0j
 jP61uaHHODFrS2moz.PzigOXNkrDq5bDJkHPH9pPRjKYaADvWzfopHyfbz5tGHt8ozqXhQFveN8E
 UBxetHnC5dUlqKw.1WU_NUooRmupSQkI4Me2vQL3Jkh0oE2Fsd1QwneCXQKBnqxQT8BQf1CtzBHy
 Z2WmNhHDl.Pm8TxbINlMuy2t6DIK_gynN0l3lVcw7UmIcZVwWx_ZtqGm3SevTe6y3q1ZW6ZirfSt
 J6f3T08G5fnzeehev87McSFCsgqbBnGm6wvJS0rZpQRrW1ribtkr2T8bpzslVooer_UIkjmegSyx
 x2ReA_BMGTLlqV4bQeygNfZm5Odc030_ruH1hGztcE7fBTHkAEECwwrUiPFmLrsEh80Ce2sQ2UAf
 nH7pm2onNs1IZl40R5byRS3D6uGgOfPjYmkICD.yqoicXDeQ2VH9WTW1INjLtjMxjH3xSeGOcSxD
 4OLEyLHKuu84mh1XwFgkVPTtDNGGc96P980sqBo2PA3nk3h6rpCtGHCMbocd9XOn_j2ViwOJ4m.d
 mFEw5NFF97F8MpCBvRPG37S40nzdmPXVKv4D3qFsMRr7abtInJvRoK3JYTaKnI77zlk9hYoQm7do
 IsIpgXLaDJEKeR0KFp0_9RCt5qwJrq5SPEmy0LR_Qf32170_gfMtSbjjeNXL4zXPfKhwzx6Tq8M3
 17421eyvXeUr2TUY0UKAKrUoA4BOrbILJx5IOCz7ifMjfybjnWGGoxfmQ1hMYK2_UTB7wkn3AZe_
 fx5T5Iw83Cq2EGnjahKVP1XPBrR7BGwcmv5qfbDTsG86C0nOU6zeeujgnp6y_LeD.oErNpsaMorJ
 HkgeONEn5uJBKk.n0DAYIzsHMn.uOn9LxPNj2LC3P75vixCzgSbX6wYOxGdqHyLE662xIVbOWxP7
 tci42sldSdjHozuqqHjFaQmOqmBkdwYHFqaOJJjR17G9zNp5zIAtmGe_kibO21JIxfE7Cwjqo7eR
 urfyyuPwQ.83ozUd.THqsa069rmhfOdEZN9lt4jyfygpuyNHHeQTrVqBD70ifUnad3zh.xawa5RK
 R1H7KklQJBy_EFImJn5zQNWxgtB0V33XUaNeARwTYUwKETdiYN3Ow3EocgJyMY.9kooe2Mh5OQNG
 rJgc.6a12TwFxGfwkh87zvzXW7wN9qN215cvy9VoseS8hV8r3OuC55Ve06ZnH3nC3IQc0eUSRVMg
 W7sZFQ.1EmyIhslKpgsVJlesla8j50v9VtmOTBnLeXrDEOQpV83BV0jikvs8YOzMJEQ54nCeFZWA
 iB7YCn5yvvfcNMb_TgXG_oxQRJQdnaPHcp0G5r_F5R.8NvuQBj5bRDM9ZgvRwpPVIcDqXhpssxZH
 rhA4NhK3brLmI12iKYv2JsR.w2Gfk7fIbUwMwq.c2djvl5ochVWDF8KMsUhAJbNtKcJahRs5ohiC
 Lhb80adaO3Y4DTxMDsCeqCU0NPpuIhuBFNwkJ8zFRpOD4LYbGTFH1TBXLaIFsRw8ia95_ko4KpDI
 fYeQxKmVC7hudYaRgXuz783mL9awjI5ZAKrPq.LlhSQt.Q4vQuAsOHi2OzeXRR8seYeQk2kT7jvD
 4.OMB8CrNLOzTk01erpu3zb1Vy4leXkxOSqZSPu4c6QW6.JoNnz_03W1j9RdP3_ullTVLD8fOWN3
 ADvxUI2PTdAjokLP.mOs.phZM85mosE5uAqUIHLhfoaH.PeUj0yGWr52UvztMFA2k2W64Cn_hV7Z
 .aj5Wj4ZT0Fpw8REk8GbqS_fQV3iurX1DbQyYkcwUpmZx7rFRlZPdNu_nJsWfnqch_oBtzC0W868
 K1tL5nrONOYM_ajBD7hE12TOJg8P1SZK1qdTxWOlKV6i16MNXqZGM6WdWd0hk06pjTBGMxd38tFC
 0iuKWisX3i9PCmayxKkVvF_K5bzQWTji2
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: 1a4dcc6c-9bb1-460a-b10e-a5f481bdce48
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.sg3.yahoo.com with HTTP; Mon, 23 Oct 2023 07:23:03 +0000
Date:   Mon, 23 Oct 2023 07:22:14 +0000 (UTC)
From:   P J P <pjp@fedoraproject.org>
Reply-To: P J P <pj.pandit@yahoo.co.in>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Message-ID: <1696997845.757587.1698045734236@mail.yahoo.com>
In-Reply-To: <487dd696-0d74-4adc-8f0b-a9898d8085d3@infradead.org>
References: <1236784830.606269.1697999064177.ref@mail.yahoo.com> <1236784830.606269.1697999064177@mail.yahoo.com> <487dd696-0d74-4adc-8f0b-a9898d8085d3@infradead.org>
Subject: Re: About Kconfig indentation fixes
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.21797 YMailNorrin
X-Spam-Status: No, score=1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FREEMAIL_FORGED_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_NEUTRAL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,

On Monday, 23 October, 2023 at 05:49:50 am IST, Randy Dunlap <rdunlap@infra=
dead.org> wrote:=C2=A0
>>On 10/22/23 11:24, P J P wrote:
>> Please see: ->=C2=A0https://paste.centos.org/view/06ed8bf0
>
>Usually it is better to try to find out who has been merging the most rece=
nt
>patches to the file (by using 'git log' to see the history).

* It's not always clear from history whom to contact. Some commits are quit=
e old and original author's email has changed since then. Will check more..=
.

>> * Is there some method/rule to the indentation in Kconfig files/entries?
>
>It's in coding-style.rst instead of kconfig-language.rst.
>
>from Documentation/process/coding-style.rst:
>
>10) Kconfig configuration files
>-------------------------------
>
>For all of the Kconfig* configuration files throughout the source tree,
>the indentation is somewhat different.=C2=A0 Lines under a ``config`` defi=
nition
>are indented with one tab, while help text is indented an additional two
>spaces.=C2=A0 Example::

* This is nice. It'll help to add this to the Kconfig language text as well=
. Also guidance if config entries within 'if' or 'choice' blocks should be =
indented with multiple tabs(\t) or if that's not recommended etc.


Thank you.
---
=C2=A0 -Prasad
