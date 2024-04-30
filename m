Return-Path: <linux-kbuild+bounces-1717-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C318B6BF9
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2024 09:37:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6BA31F22077
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Apr 2024 07:37:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE05A22067;
	Tue, 30 Apr 2024 07:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="sqOX/qDn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sonic313-21.consmr.mail.sg3.yahoo.com (sonic313-21.consmr.mail.sg3.yahoo.com [106.10.240.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03F3211C
	for <linux-kbuild@vger.kernel.org>; Tue, 30 Apr 2024 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.240.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714462656; cv=none; b=RK5lGexrcLAeRE/gBNxADlwbPctarOQJsTYbKk1fud4jhmLrG2EHimLjUS0U5zpFbXJDroK/9+e8M+7kOgVe293eY7PH/IsZVYs0uAqKHZJjERq27HZyXRrXZT8v6d42Y3qO6LX5kV0M84GB8NYf/RbJcvYxVWnmks6qFwgwW78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714462656; c=relaxed/simple;
	bh=vVyAcqQh3zb+Rf7gcfcv1QhSgsh5nwdLMwg/Cv6SIkw=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=pdzo00Rb/zMejYETOezfemj+M+h06+10VUk5FbgnZVxlyWX0VZ2Kpk14mNZCH6YVuXhHZdskNilGFWDBaRSWTLiVtRehg+rPAg/H4ia6MQASJ+TTphehcKqfMnLZooUyprNGiZuqzxKFA07aajNGjFALm2wepJ1xizvGbL1Wc00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=fail smtp.mailfrom=fedoraproject.org; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=sqOX/qDn; arc=none smtp.client-ip=106.10.240.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fedoraproject.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1714462645; bh=vVyAcqQh3zb+Rf7gcfcv1QhSgsh5nwdLMwg/Cv6SIkw=; h=Date:From:Reply-To:To:Cc:In-Reply-To:References:Subject:From:Subject:Reply-To; b=sqOX/qDn2lBiCmQii5hFwhVWAK6zUV+wCLyDG4uRqmRMgedQmiMr57DdweM5/faCEKu50knGMPZTt2CcewgY+zuwXmxRlm6cML2DHQZ/QC+VOLWU45ihP/+VaITtiqPOHa7LV0WTvLsKifDwBvOq8FQ7+cjx2aETMbThs0YI5UjvqEHKL7CEwgxEzaQ7gGhrTZQKSD/Nk2hQNzPbA0665AJmTthk0RlYgKYj05DOv8an8aGDQ0kqh401dTZQfSOpNGV+a70T186Ypmdi1qlWydPV+uAm83XxH3nO5oTAI4Qdi/TH+qA8F8H39sP9AOL4AoSP9ETbVcY5sYUE7Ajy8w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1714462645; bh=KmZji0lm2XKjUwR5x69B9VmjXKMPiBYVC7gvebbiNj6=; h=X-Sonic-MF:Date:From:To:Subject:From:Subject; b=GY9flkuefhd34bDCqM/s9Ez57nuP/Fgg3OmDv0cRi9XT9S1rt648gPrcV3hMInWPxYziSi0wHjokjlOVcvVu5aCQpQEY5dmbRBkrBwI/RicN4Yp0rLip7o1BtRMAcFXOWX5r/JBE9/q+ofIjVgNAcCqmxbrpF3ujU+VWgxUmsDvz3GtPHeKBhT9jm7kIROmbfEhm+TdF+DBcN/mgbk6UYnaGWtwKW6ptjz55NoWzglgGDgEcDfzwMV0iz1etZJTNihUUM1FpQ6FN5QokFZjTvv7ejHvdJSYvJWBd/bypWRw9rJ94rTy1gdqszo9sw353Tb4aAxfd1aloRM242FPwPg==
X-YMail-OSG: zA1jL_0VM1mSZfyWTDlE0OPc70CwGfLlANOdzTmZxJt2PncesLAOeSCeRoWBAzq
 uqY0KICQIXmh9gcDFniBjy6K_6BJV_Imrz7JXVZzfa237R6oaLBvHBOnbg4iBEv.S3o3TbTw.1df
 moWhBRlJ5i5ajbQmvCurjosfPwQHyHCdzWSEdL9qGFtJ9bwYdZUeTvKGSgZSfxFtQUywM9nklXMd
 S2M5_MiEUnldbrmRhMT34yr3okRA_EYceRpKVQwKqXIVsTaN5_kyRSeDKv7m10D4OcBeli7O8.hT
 GXjN0GWFi2E.LVAgPtO4i3DGPSFETnqotmeLQesBoSbZfZmlio0bymSUMsioksSBiBhAx5_kXQ3p
 HexYkmbEw4OmmvCSyBg70en1AUv9ioeqQ1k5CmzVuhK_bmDl8hIrToi37kRjxg3YfG7pWQc3FxAN
 SZNiTRFYafBDTQliE3SmAWgA.lH7DWhUsI7mGH0r3yZ7t7lm7DGGPUdIZgx0wZMjmiKk9yJ5Czpp
 r83VbVW36RMc3kmI48A0OQc7GvRH6GpCD1u22hl_8kf8BXmdv1kgXPeCxZPV8G0Mdo5kCotenGP9
 E.qEKKcXUEj_RxU.2JCciZn8S0P7kGhM7lWmdKa_wyqoCiLeYBg8kR_2FY6k1UzYZ.DHBN3Moe_r
 _SNUd7EDeCgafc8W_sES2VzX0etJGOLFueOc6eGh1HbYk3KSoPOJtmzb9tCGVtGu0Xld8vzsNe8k
 bhYD8nJf8KzwZs5rkwXIkBW_j66KmK2zPSgdmMev1y.dZ8TC8Waz9E7hJuKFuAHbXaEgwrijgF2k
 CaCpX3tgEE06jqL0vNZ3DsmWlIGHLQDahBZXarxHEvHes0fwIZsvy.FAPMcFT3c5l.TszlcHj6j8
 vSkeUK5ZaCLfssJhDPoKJ2ZL9txoyEu.RzjjTOpEwosTPrrttPiIg2ypbrZfCNqiBuqiFDWJqgm2
 KmCdXzeMYpYNZC8EOrLvMn_gZTxEhFgoNCFqWCEzmalmye6WFz_52wEr18IQT7WMSmDMRwZiTDb6
 J3Pm8GjAEt2BpowpVz8eLCDK4AWFgDcNjdcp.uk4XUVYkcOuBCbXXWjBP_1jp8hf2DSlBbvAVMis
 m4cNr4m7Wm3XXA5V3QtAB2mvff2CEV03nSqCdtJSby4ND5mMq8LyhzrraGHpljONRlIwQoJqVG6y
 uo9L4IHnoI5ovc0FfrwfWkBHgX6YwXUosGARr71WrlPPfNxkFypWe5Sb0okQJ0khmVPANKBCYWYc
 .kCM2jH3iWVBVal3GSaH_M6KjaLdb5EbsFZmYDl_zRf16cozYGoHkYBmDEz6pbTu8i3or5qHM8hL
 vcsCWVenRTMWrZFE7NojjfKCfgaDk.cbYh4LoikqxVuFSPcE01xq6RHs7Ujm8zTnz4pAsh0DQh1V
 3AVJb3_5rSmZM4j8cIoTsp_F64rLRh4.LcpVD0o5xJ_lWv6aVsBM6EZh93FYvuoXmiinpv.e7LJr
 PYBUBvaoEGmzec3cKI7oEsmqk8ueIOmOuW2NfjtGL39kKSOlKZBhF75g6YvkRZ1mNIlJemDRVaml
 .5uAWO4TBKStBEp5Wrz.h3poPglTxAHSjnbLV4Q5f_rIOvYgIpaNpUq5KFXKpUvZKFgCC0Ov2c.x
 ItF4KtopTtQ3VNYiZoMS_5XjMZgbEhWYwiip5zU0bmHCuj_52VDeHOgwyhaqE_50SPjzcr8Yn5zJ
 X0hx8hvLx_SYDJHgkuAIk7PZenn7GKp0EfW4LD6nXa9Y3ck2mnFkf2b_LHPeV3yk2QEI7tXduJT_
 a0rmB.WhpnABsnLMpb0MUayX08ECO7_V3Uj_w4q.GgDXHKNzEGhIrOl82hwsWmaX3XELSBd_s_UB
 NsxNnr3QMo0c4OEErQxGQoKamdCXEFkTPEuLFJL.SrPHiB8QVGHWDxB65u_TUpevR7LwELrGas6U
 uWmVNC.ycD4Q06aK3l_MRBpYVj6kcwOwjlsUXMJ2cZZueklhYjwRkwKgb6MxNgtQB7hlsCEGNgQp
 2eQEsMItIxQ4w0SdjUquNbpFNaqy5wi1WuaNL1Tz8MD3OQ9dXEYbfs74Y2G3AJ820cBP1mlCNaEG
 RS21o7qq.poj8vYzYIlhlOoRBmW4Rve.5MVXdvQzYbuaZBcT_wAgf.w7N.0taD_6_EzfVaeuYNmf
 _bibsfsob5HCZAaroDKO3nD.ZbC80E93vjjwSkH2qVjUApjvcP5XqnxH9VG39f7R2EqYVugs6AOq
 ESFZjSfbC5yD1ln7BMHzP.M5t2momNOsUzafFxnOTXyruBWcnSi5CbJoQ65aJHLPMwBL93QzPFd_
 y1qlHKUSJxKoakrvExJR2A9x6QNDs64FaNg--
X-Sonic-MF: <pjp@fedoraproject.org>
X-Sonic-ID: d0f5b2db-6c62-4061-9c0a-46a0991c323a
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.sg3.yahoo.com with HTTP; Tue, 30 Apr 2024 07:37:25 +0000
Date: Tue, 30 Apr 2024 07:36:03 +0000 (UTC)
From: Prasad Pandit <pjp@fedoraproject.org>
Reply-To: Prasad Pandit <pj.pandit@yahoo.in>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Message-ID: <1597607635.3365742.1714462563217@mail.yahoo.com>
In-Reply-To: <CAK7LNARB1WuL=yduv+XjkjCCagrgWQUaKEVk82wn0+QRgoNVTA@mail.gmail.com>
References: <20240407072933.3562124-1-ppandit@redhat.com> <CAK7LNASZR=n+T=9Lo-5=Nw9WTwY9ywdTNvAUdt8xDXxsnNu3Tg@mail.gmail.com> <668901914.114470.1713335369416@mail.yahoo.com> <CAK7LNAReoYHT0-SUzFT11y=pN6GTLSgu0+7Su+2Tthkz5VFymw@mail.gmail.com> <1927988181.1604457.1713852967808@mail.yahoo.com> <CAK7LNAShU0GS4e=wRupgwUDHhxMR5SVmkWn4mTZMU6r+Vng0Xg@mail.gmail.com> <978513013.1900588.1713936355848@mail.yahoo.com> <CAK7LNARB1WuL=yduv+XjkjCCagrgWQUaKEVk82wn0+QRgoNVTA@mail.gmail.com>
Subject: Re: [PATCH v1] kconfig: add config and source entry details
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.22256 YMailNorrin

Hi,


On Saturday, 27 April, 2024 at 12:51:45 am IST, Masahiro Yamada wrote:
>Do you see any grammar that treats T_EOF in
>scripts/kconfig/parser.y ? It only handles T_EOL.
>

* Right. If the parser rule is expecting EOL, but still works when there's =
no EOL, that seems like a discrepancy.

* If you think that's okay, then that's fine. It'll help if the implementat=
ion is documented as is in the Kconfig language page ('kconfig-language.htm=
l').


Thank you.
---
=C2=A0 -Prasad

