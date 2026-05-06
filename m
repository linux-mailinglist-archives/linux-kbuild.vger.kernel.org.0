Return-Path: <linux-kbuild+bounces-13047-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNOgAQE2+2nfXgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-13047-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 14:37:21 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF24DA4BE
	for <lists+linux-kbuild@lfdr.de>; Wed, 06 May 2026 14:37:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE6FA300BC9E
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 May 2026 12:34:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51D6244A710;
	Wed,  6 May 2026 12:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sNwSmzvK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18CC43E4BA
	for <linux-kbuild@vger.kernel.org>; Wed,  6 May 2026 12:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778070848; cv=pass; b=t26hdkgewaittfqICevO4r0Az392O8OvuD4tdYtQRqeV/GrlNxi5k4A1PrIP5E6/KYZW+lvKwVg7HMEsCsPdW2Ua3et3HFlE+xbMtlYOleS3pkVv83uo4hTMPu5e5jyb72GIQEtilXsvCAKBwNQJxr8eya1DFK0nu1ifyFwQhu0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778070848; c=relaxed/simple;
	bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iXJq4YDUdi21dpWhnaWBaw/8D5NNzHFMjeDIMVWHMAklaD02F+TxPG7Az5FaxkPFF9Q/Ykf57gkcK4e2bjOGULU2asoHVxpQIogrmfRin3v716NxJr2HQbT7SsDWIwqIhP90Ag7n0QQgfycShBvtS9e1drv3WHaCKEGsX4/j/N0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sNwSmzvK; arc=pass smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7dcdaf06498so4330456a34.2
        for <linux-kbuild@vger.kernel.org>; Wed, 06 May 2026 05:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778070846; cv=none;
        d=google.com; s=arc-20240605;
        b=AmN8p2xgrnMCO0ccC3T0l7Ib5r56Hr62ZRNiei4Vs8UjKSoWPSwMut02Iyprh0oOYa
         RG7cahKh6hrKe2XjTxieJFmk0Tb4pP0gM52XYLLzorum9iNNiwQ6H9W0eOtaVPHiq85J
         Ps3Twxmu3GWOQKruFBtgILABLlI0qJr8o1tkSdX3ccDlhsUEsx+Y71DFweeqo5Sec9WQ
         4i2aI5ClUXnOQV7PiR8kux0aM3Cq3OxqEpz2PxV2paO9S/PJKwJ3HNqn9OWGRxrU42DM
         P6YhSXCGFS/+6lDCxSHd9rTOmJVpV7WSBVh4STuyPXI3894Hn/OA/mo6xEcpgTstnYUQ
         4gIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
        fh=OlbZJb7umMwJTO5Skpg6RfSxdF+47vT7hX2qwKgp8vo=;
        b=IR+/QQFJg7DoTQ60HFDyFyTirC6RCJW1uuV56/mwx1NDz4MWNTnwa9AXx1mI6yu2et
         ace9S5cZlFq0BWJWWmj+P1e3aZ/Tbiw3I+wy+ZImftt9gs6UabzyB3etyWEQ1lTLXcyg
         XAYSCvLb1WNBDbIOpXqUK59d9OGnFcRF4plUukvjJTLWerthQ/CCRvACoxtzSOstsO8U
         vzGXH3kLbQbsB+3A/I50r89Qho14E4dnZ8RHInjqJLz/B2WqcQfSMB/egdRoEWuUvtrl
         1Z5SudLLZoAJwDJBZOtQ9AjJCHb2LdzSbQElZJ1hWCXRmBotLP8u40kRhL9hQEmB8hRs
         k1ww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778070846; x=1778675646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
        b=sNwSmzvKCZbXiIF99yD6NQtSo0UvmJY9nNHv4s9MZvIT4GxvdmPSB1CvzxPAwfNjqX
         19DP4zdMmfhl2yJblz041NJb85RUGMnZRrinvic1M5xNHAA+V2hEZlDd62syc3iyeX1O
         zmagvw2HQBahaLZFbsJ8/a1w9VANOX68V2x9Nvgomy2My3clqPbjvr+89IAMWMpKbffF
         qwivhlKvGvG2OJynxnDaiBtLv/E1EgY4kHY1yPIYE7aUy0rEXcPGCgWrS81NaFPb42V9
         76P8S41QxxD/hLxr/0qSR7S6Y27Vny3f+BN0N8QYr22S0gZfxBbD4FIpyqn7ugjzKDZc
         NlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778070846; x=1778675646;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f4JCfvoAplsuFCM2nsurtXc86gPCyG+1i553tDk/iSs=;
        b=nUwfEJd7+uWJE2zKcbvgDVMPGBtU11KAHLzdAmDktmCpOzfxu1cYC1LCvX/7TgsuO3
         /013r78ITHnXCAcaoukeIsYzdqt3ktlRE89z40OebNEqX+ANTlN0o243JUNsfKH46CMg
         VEe52IXxAOVuoUcHLlhLRdY+LJyUfgxtPe3di6JMIm54RD4mfF87s5IFMplifeQO3hGq
         ZEFGiSKz7r6vnSQVdd1Y6m+fdOjrqvAxTVCPm3Y/A3as5uiP/kHPMoLDX4SclBfb69JL
         DOpSs1hPH/cyXNsR8OipolAQUcYLQtKPkvOL2SoE6oTP1tI7Nh6P0IPhYxiDSF4HfPIj
         73rQ==
X-Forwarded-Encrypted: i=1; AFNElJ+D9zmZfNpAIayLS7vp+j4mnGRh+IMZuLLW5CkFBarEz20rZKRwx3k8mODaJnUIZZLm6WorqFEIFjeWEws=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb/RzTgn5cN/2JQWc2uvgOoRZXmmtK69WmvEnm/eEEoBRmfQ7E
	pyOiLUD3U3vDXvoPmYkv6Srm4HB/hcr39QrlsLKLtcCWbRO1bzsm2BzMhsccM6zokhvZnq4oxhG
	w7SzJoGDP2I0wTILWSfpPtlfdByeNGX4=
X-Gm-Gg: AeBDietH0rgfhBGJFtGMOyrgTBbDEXoRK7xd9SLkL2LgxsI4j3+LOwcRsEFkX2Jdiql
	qMTAwS5zRC3dsHAIg2FPYrBnXWwxlS0tWrrsTZIE1XTzwAqCqLIsnD3/9Wp48Vmm/sInyZTfKlm
	HHKYC+jkvH11J/4nDP8G4YEKCX0aRPBYspMkLKfMyW02KlNKi54h47r/qjg066P/9OFv7tBsU+K
	IWIR2VRe1fyPrTZEurorgD1hTNgk0JkZyEES+lpYZtLFy00VotX4cyGLcyt6xT4PESoeNZd4Ci9
	/1P+OklXiuChbc8yG+P1fUWVuB3DnjOGwvqZVAn0gWgnr0Upjpm7k/pmcWwlhSmtNdwidQWbQAc
	Nh+KpZjosYlrJroh/fvw=
X-Received: by 2002:a05:6820:198e:b0:684:743e:86a6 with SMTP id
 006d021491bc7-69998cc6383mr1554293eaf.20.1778070845636; Wed, 06 May 2026
 05:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
 <20260428-bump-minimum-supported-llvm-version-to-17-v1-1-81d9b2e8ee75@kernel.org>
 <afoMRMnSQUwk1eaN@levanger> <CAMAsx6cPfPVDBpL6wwHeqzWLqPwQB15pKgvgVu-Ni3Sjjkdf4w@mail.gmail.com>
 <20260506062128.GA322298@ax162>
In-Reply-To: <20260506062128.GA322298@ax162>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 6 May 2026 09:33:54 -0300
X-Gm-Features: AVHnY4Kqm0TmRbtoSmYSXiI54AO8i3XE18imVYZf5RenKY8Zy6KgZxL5067apnU
Message-ID: <CAMAsx6fDE8WFfhiRRe5CM=oxUhBPAnWD_DiGsY6mC76TPTgXMg@mail.gmail.com>
Subject: Re: [PATCH 01/14] kbuild: Bump minimum version of LLVM for building
 the kernel to 17.0.1
To: Nathan Chancellor <nathan@kernel.org>
Cc: Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 92BF24DA4BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13047-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,gmail.com,vger.kernel.org,lists.linux.dev,lwn.net,linuxfoundation.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[danielmaraboo@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	RCPT_COUNT_SEVEN(0.00)[10];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Wed, May 6, 2026 at 3:21=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:

>
>> Thanks but I think I can just update the version number in this patch
>> when I send v2, as the update should happen atomically. If you patch it
>> separately, it might not be true depending on when my change is merged.
>
>> --
>> Cheers,
>> Nathan

Hi Nathan,

Thanks for your reply. I still needed to adjust the changes.rst file
for the Portuguese translation (pt_BR), as I found it was quite
outdated compared to the current English document.

Thanks,

Daniel Pereira

