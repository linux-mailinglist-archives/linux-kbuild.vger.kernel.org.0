Return-Path: <linux-kbuild+bounces-11425-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPTpNTkpn2nmZAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11425-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 17:54:17 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8319A19B037
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 17:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 431B630624B5
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 16:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8443D6463;
	Wed, 25 Feb 2026 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7V6jOwa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0953D27A45C
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 16:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038150; cv=pass; b=Hpoy8UbHMUwfbYRiPbIUP+7cPiK51whpQpIxQ1CduENZoInbfoygbPbHDN/Ii26zSC0rfdJgt3PTmIiRcWvsBpvDY3cgqK02aLKtLc6PDZ01/SOi0SWdTgNVpl7q1SOtvUqD7kNrHwhgBi39C/DkI5W4n4WHl+hJl8i2xXjs5F8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038150; c=relaxed/simple;
	bh=qUcBfUVCJMHQ02HDUivowOpgA68okT+NNgCAK6huiPI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tn2gwjTtg3yKkqt+ptTEzoMeDiKTnUIN+jmsHyBhPK88sdCWWXRdakTYu4y+Mi9v6v910vOirrXfUudVqynET2xmxhsc0YB5izw/NCzId3f0T1mYrvZjS6RpY32XXAFShRqMyBx0QysvWd7vTU6/a7BZuXhHVWpaNZFsk26JPE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7V6jOwa; arc=pass smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-899b95707afso12605666d6.3
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Feb 2026 08:49:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772038148; cv=none;
        d=google.com; s=arc-20240605;
        b=P5k0t6Sme+eYnhq74w3IZhaWqnJKDccetptzWHgQtatk1B17z4ehNK5NoKQWxjoV8p
         Y7Og8QiZgj9YQcpUA0K+XHEIunupbhON0ly4vEE9ta6aKpglUB0cjLxJaYHP4KceVPuh
         gdn1qdnPO/OGwm15lVsFaH5+xYYXPz85lvFNo17knam1Beg/oUdhjAvcxJA+3cwKXVjl
         iOJdD0T/ydf+TQ7ywAwvSzNdviX3BoSoBOeGGLjAng5Y4xDcj3naXo1BhQLEjs6EBp5u
         A++oRCuuzrD8juIV9wUp2nwGA9KdjBydDUPuOWkn7STj6cqU1yZrFGEWGjKuenEwOFKm
         dUkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c5ZB9cOqF+3obiDHat6tao77QSa8bRb2BeyDLbs5Nxc=;
        fh=fkR4kuH/June8IQ3ABMmRz4DOydw48uS6H8N6LP6+8w=;
        b=XhRTvV8Jy+Jbh4QBogRUWRWsjyIX+/AZr74wDzDrqJCbQb2ei4WDIV9ABM4pS/4yzs
         RuM9B2Sq9H3aHZ9WrIwyq9auwfDW6pqiLXBCLqBG1AOFNfFHwneBIC+5K1uTDvBNeAnP
         mu+vWYSAtn9PlzIWhMz9ASaYCf5qzFtWBnuonwC/e62FJ3aU40WnJUFCUcObGGIWXqF/
         o+IDW69aMnyhZ4E4f6QzQG02v1XjcHFehPlNz/hr8UOKYb6LuiMsA4Xxu2k/RwkKKl9K
         HurwnnxmB0epY0edUUGV0GLa2TePBNhjp1OMWhhxGj9P+/JLmbdc2kvkzoWOm/TRmJ5C
         LUqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772038148; x=1772642948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5ZB9cOqF+3obiDHat6tao77QSa8bRb2BeyDLbs5Nxc=;
        b=b7V6jOwaPrT1J0osWNvxTb29b1RaaKyy2aNIRhCwIf/5ahh2BoTMll9tG9G9wrzzxP
         p+MQ5opSDOAHOne9APBLPZ9K5W8hgyz3LP0eM7Z8E77gZgigcq8cIwpppEhWQBdH1Qyz
         YZ3rY/6gNZ2MKrlJ6NLXd9U8rA+hnaPE7A2l18J8J5fcik4CMwVfU0w1m42fO8pVVN6u
         nHCAu5dL42bPoN9oi7AJGFvag+bDxCo3MRFD4inN0ga5JozR0SFxOueZF0V4V5gz83K5
         aoHoX3lTXa6RtNztDvLnQN7HLkWaIT0BJOZtujLJ4bHxerLvOd+S0TV1XJQ4bj2vnMGA
         +bJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038148; x=1772642948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c5ZB9cOqF+3obiDHat6tao77QSa8bRb2BeyDLbs5Nxc=;
        b=Asws4KHk/WqHx82SWpjPCOPPFtIwxMl9MMCp+YNUV6QDXsq+oFz26tC+QRG2YnKfQU
         jLjjRcyFeMXB+EZdnwpHC2y1uRRzsdt/QOExClElpOV+GhmA66qkzCPxLlgb0WSmjyML
         jZDHuF/8qEV15sO3zhM/7YnGktOP8zoLf8ZC2NlKugFhOaZ93qSBBa1hUchItbr0KtET
         CK/s0xoEraneAriDxyBGiJ/TIsNulfaucKJ01YfYKtZdKKThBMkqDbCyhcY2FrIlG+YR
         +t+xUpAemmwi1gJMZwSNhWRHVyV5l4aonJirqutIBbORJpaU5dtH+sN6IXEp59ilCY1I
         UNoA==
X-Forwarded-Encrypted: i=1; AJvYcCWNTJz/HbsMbi6Ymj9IniRyCMKhsRnxSmxCoTJ1me0ZreACbElgDMgNcSL4ZYax6qwFb2LjQBXdyYwTfEk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDszfz+q7TLE/6fwVZdUiDARQheDowXQp+kD4CPe2aZK1cXVlE
	CuED1YAMfDPCyaLGesnlQL8Zbi8m80eyvWCCo1Q/ARGZzoE7pp3xJanl+BeoVDNu8gZdL+o5qo2
	flegbqd5fKYlC5E/g/7w28IlxiJC4jSbO/Apl
X-Gm-Gg: ATEYQzyYWzPxanwZw7hreT442WCIaNmBywCrxbLWf86SDVMLICNXC9C3B2jcuEdGH+X
	u9al1pKB+gquGNXjC+JmG7MdHECjrSwSh7mO1f27Ty9CEsXGho/lV0c8P0FFcaVm62ijvpaw/7A
	oTMNYb6ygX8diY2r1k/Q9p2Eqpz+qr3gfKlIe/fz2iWSFiP1Mq6hmZIxZPJSjJvOTB3oYnH/2St
	WgSPFOgLphb+6yRyUHuF1u7CkkJ8NBiyuXBAGHBwFTup2RJPVc2bsFYNjnN45zkTbw4vHXTAAh3
	zvmF4CKKcgpMudGQkdl5/pCYaI7ndK7su93HOd9osncKYKZCG8OvJhLBlV78BCI8b/h58uDFbqJ
	uGtlMDFtXAeXdsblrHQgiz/ZhHXsDNeeHpsi6J0OBgLnyxafyza88GqBlAUcmr2o=
X-Received: by 2002:ad4:5aa6:0:b0:88f:ce04:3261 with SMTP id
 6a1803df08f44-89979c3bdf9mr237199666d6.6.1772038147473; Wed, 25 Feb 2026
 08:49:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGk60SF8WxDMpx1ALrne40qycg5J-hxdBniFnoYG=QhvnX5ktQ@mail.gmail.com>
In-Reply-To: <CAGk60SF8WxDMpx1ALrne40qycg5J-hxdBniFnoYG=QhvnX5ktQ@mail.gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Wed, 25 Feb 2026 10:48:54 -0600
X-Gm-Features: AaiRm53yJClvWg8bTS6f_4qJmoNm5UPG5U2HBe0cLcAxbG_AlHCfRnAmxbyr5vo
Message-ID: <CAH2r5mvcrt3T9x-Wqpz_OXVr9cWtBSft=JpASsFDT25CYtXJmw@mail.gmail.com>
Subject: Re: Kconfig: CONFIG_CIFS_SMB_DIRECT bool option silently dropped when
 CIFS=m and INFINIBAND=m
To: Denis Nuja <dnuja@enakta.com>
Cc: linux-cifs@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Ned Pyle <ned.pyle@tuxera.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11425-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[smfrench@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,enakta.com:email]
X-Rspamd-Queue-Id: 8319A19B037
X-Rspamd-Action: no action

It didn't repro with 7.0-rc1 when I tried it. Any ideas?

smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ ./scripts/config
--enable CONFIG_CIFS_SMB_DIRECT
smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ make olddefconfig
#
# No change to .config
#
smfrench@smfrench-ThinkPad-P16s-Gen-2:~/smb3-kernel$ grep SMBDIRECT .config
CONFIG_SMB_SERVER_SMBDIRECT=3Dy

On Wed, Feb 25, 2026 at 10:24=E2=80=AFAM Denis Nuja <dnuja@enakta.com> wrot=
e:
>
> Hi everyone
>
> CONFIG_CIFS_SMB_DIRECT cannot be enabled when CONFIG_CIFS=3Dm and
> CONFIG_INFINIBAND=3Dm, despite all declared dependencies being
> satisfied. The option is silently dropped by olddefconfig and
> menuconfig refuses to save it, even though menuconfig displays it as
> [*] (enabled).
>
> Kernel version: 6.4.0
>
> File: fs/smb/client/Kconfig
>
> Current dependency:
>
> if CIFS
> config CIFS_SMB_DIRECT
>     bool "SMB Direct support"
>     depends on CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=3D=
y
> && INFINIBAND=3Dy && INFINIBAND_ADDR_TRANS=3Dy
>
> Root cause:
>
> CIFS_SMB_DIRECT is declared as bool (values: n or y only). With CIFS=3Dm
> and INFINIBAND=3Dm, the left side of the || expression evaluates to:
>
> CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS
> =3D m && m && y =3D m
>
> The result is m (tristate), but since CIFS_SMB_DIRECT is a bool, the
> Kconfig engine coerces m to n and silently drops the option. The right
> side of the || requires CIFS=3Dy && INFINIBAND=3Dy which forces both to b=
e
> built-in =E2=80=94 an unnecessarily restrictive requirement.
>
> Additionally, the CIFS=3Dm/y conditions inside the depends on are
> redundant since the option is already inside an if CIFS block, which
> handles that guard.
>
> Observed behaviour:
>
> menuconfig shows [*] SMB Direct support (appears enabled)
> Saving from menuconfig does not write CONFIG_CIFS_SMB_DIRECT=3Dy to .conf=
ig
> olddefconfig emits warning: override: reassigning to symbol
> CIFS_SMB_DIRECT and drops it
> scripts/config --enable CONFIG_CIFS_SMB_DIRECT silently has no effect
>
> Proposed fix:
>
> Since the option is inside if CIFS, the CIFS=3Dm/y conditions are
> redundant. The dependency should simply be:
>
> - depends on CIFS=3Dm && INFINIBAND && INFINIBAND_ADDR_TRANS || CIFS=3Dy
> && INFINIBAND=3Dy && INFINIBAND_ADDR_TRANS=3Dy
> + depends on INFINIBAND && INFINIBAND_ADDR_TRANS
>
> This correctly expresses the intent (RDMA stack must be present)
> without the tristate/bool coercion problem, and is consistent with how
> the surrounding if CIFS block already guards the option.
>
> The same issue affects CONFIG_CIFS_FSCACHE on line 191 with an
> identical pattern:
>
> depends on CIFS=3Dm && FSCACHE || CIFS=3Dy && FSCACHE=3Dy
>
> which should also be simplified to:
>
> depends on FSCACHE
>
> To reproduce:
>
> # Start with a config where CONFIG_CIFS=3Dm, CONFIG_INFINIBAND=3Dm
> scripts/config --enable CONFIG_CIFS_SMB_DIRECT
> make olddefconfig
> grep SMBDIRECT .config   # empty =E2=80=94 option was dropped
>
>
> Cheers
> Denis
> Enakta Labs
>


--=20
Thanks,

Steve

