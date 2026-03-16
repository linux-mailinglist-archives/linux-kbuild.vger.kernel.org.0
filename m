Return-Path: <linux-kbuild+bounces-11956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAwXB4wNuGkWYQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11956-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 15:02:52 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D19F729AEF5
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 15:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2BA513004C1E
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 13:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4118339901A;
	Mon, 16 Mar 2026 13:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b5IFDBFB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6193947AC
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 13:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669582; cv=pass; b=VwqN5UTTCwt+/eB32hdmDsl02lzcB7Ea8PWiRc3cJ6Ap50t0VxWpziuEF99TnfrDnj11kZXd2dCU86DPbeee2H2xFBnhiYjvya8jUi6DbKCeI1/JPfmiJJQejFGrhFmStZpkTCrIE1VIpLYJi3vrPUZIULeAqSG5+vTWpQs/dpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669582; c=relaxed/simple;
	bh=TENiWIskmMEWydIsAXEosg505GukLfFhkft6Jm8fr0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=m6t+j2TQLo0La7keNIbPyOeHMz4AtX1psyh5PpaP6NQeRyC5dozVEGOu98huybc+47KlPQ0qET70/jqZh6WmJgEiRsZJ69pPsOuzuYAMYOZwLmkdiAGQLk3Aoq0cUZzqPjTddzXp/idCPoo5+g7hp3uJTvFplkV4oKYaovIa7hc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b5IFDBFB; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128eb45835cso161849c88.1
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2026 06:59:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773669580; cv=none;
        d=google.com; s=arc-20240605;
        b=kiqUGhBjojFabsgzDgvUU1zixHbQttCCuNfckUAlLtRl7ugmfGPSHlnIab/csugmnu
         yqZDnCkKP1XKJk9Lu59+TQhnUIXqpLd8SQ4PHVGr3sbgrNtNxCAlc11n0e502icn2FCY
         /tz4lEHFbyEWUlRq83oGcoB4zbk3DStPv+Srkcxw/um4TTjxVWMc767TZi4lTdl/vZHW
         OXnE2yC+i7LjHywF6IIrHrCkKxbCduqqrD2FSRdIhxLFGE/GB9F0EQ3+gIYcfsjsJWTS
         zgvUx0sjIE2EesABnGjnahiEgTuGdaU/zJmdRiIS0ZGa+z2SNMnpmdXEq60gLbAopTBW
         P2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TENiWIskmMEWydIsAXEosg505GukLfFhkft6Jm8fr0o=;
        fh=ONVdHDR50cT/445k2AGguyksvSiQKtbBSGKU1kGuzN0=;
        b=TEiZ4E+Ircab5HUSgAf30H47Nb52C1FtGQY44TptB7v8VRyOsT0gqHVx60lOlRHDCq
         2V0riGFYEExpZlnEzVTPoXeQLgotU/KZ/kLE0i5jcmx+dZJzatT2CZZlnJ1GYa8EQu09
         b0pmV/ksDsQGsZXszODdOUDs31au63M4VcKcjVfdw66LMPbyeFrxz0UoPTQapE9DbZEF
         km4VzvfJwszy0Crur6uc04c16r0KNWcnEj/wUOTE5yE6T9wh9TrMamrOeNB6bNqOre4f
         bLoTN3tPDQtep8zJwWBeEcCBEtezg4RmEScJo5LTWL7XbT4tpnp5esyL86TNiOmiRGbE
         9A3A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669580; x=1774274380; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TENiWIskmMEWydIsAXEosg505GukLfFhkft6Jm8fr0o=;
        b=b5IFDBFBlcjTI1q+EPX74cJLmAHehGsFNOrHWi0o0ARdJ+JTFEc2bc/Wl2e7e5RnPN
         SRDPVWrop4ywWrVuluAHcKIoraDIErbvBEXhv+pekuOwGI+m4y2Smzt83rDTWacQl1pj
         Wzr3n4Tpr/ZfaNQzJ7qKdjywb75a/Lzv4+Rvm0VfiMdKVGyg5npDHM36//E+axJe+aeb
         oYqK9JIckUy2dNZSZskVR69UaRJTxl7zOSVCBefNZWPk3C3/R53ODDJNCc5wtuhhxGPl
         7JG4QQ1MEopkyF6r949+15aFM/2vlcC8DOLOtzLiLJHD7I3Utxltg71m0ZBwSkOcQPyN
         bHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669580; x=1774274380;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TENiWIskmMEWydIsAXEosg505GukLfFhkft6Jm8fr0o=;
        b=etb2CtyicJ5MNx4TilAgSlIRwOr0pCsWiXc3uVyiY2ZtloVAM+XFCs111GeFOnyEjZ
         RHjvPc+pG1nznCiLGLO+xt9KMShNUM7kjSEFZh6eKr1snC+0g1xSh5z0qVavs6DSiFhJ
         M1r2zQf9om1/C695Tmu7oP2NYicH45juuvZpH6nOo7cel5zZysOJD68Gzp2JnFt1Cbei
         PEA2EqQOwhhXN4mk02P8vtXiTw2+zaA64pQJfP3zrVVABcujcNWckNvgklHn8cDn1QoG
         8Uwm/dh1aBw7OyIGyag8szn8HnVMfsSaMUrHz3xrRJmYUVM1RrhXshjC1xpix8olU/xW
         9ATA==
X-Forwarded-Encrypted: i=1; AJvYcCUlVb2JO0xFkOVzfQKDf7hkkihPwvJeIw7ogx4LnHtUVsQTDav7dVL6vQEe5Xh5g5UmBqS/VZo85o0Xp1c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw93GxfYrJQ2JvHVV9NFtuwhC8U12B6wVVAsJEPKAXy6uK5cs8L
	UfbRx1MRCK4pFu51YDz/vTvszb5cMNO9Cuql9VU4DmM/v90bceImG9P42vaVwnmV8xGBmU5M6Ee
	ciSS503eErzvLsXKqFdL0yV/CbJ7iEp8=
X-Gm-Gg: ATEYQzxQ8PxwQJa4BBliuV7IG/wZpjf+A89nHUGVj0r52xRJfnII0XzrLu3EHFdYD1y
	BoJjfy8tux4DjMn+0t7JXF3KGLnbw8AMjLTagXBhi5fRftsw/x5a9tXENRtyqER104rWANIf1DT
	h1tHg5cfawLf3TwqBWxB58NwKn7dMuyAKspSn8uqSTOFX1MGIb7VVC5fYk4SWZDREFwwHfS2L+b
	xL0mGrD+wNB6Gr/cdjhYfh6Iu8IGU2S1+k2HQBuJm4G5bK8cQqQRLAeDcQrffNSwNwJYVU7L7k9
	aSeh5Ym6IAKDKgBxjcMf/JeaCmhoVLhC8D7472LtziI8+3/QhJEGvpW8PTdvdgtt2c1+YCTeq6R
	tFO3Vxb93hHmpNAESq+YLldw=
X-Received: by 2002:a05:7301:fa8b:b0:2be:1946:858b with SMTP id
 5a478bee46e88-2bea5537069mr3308614eec.3.1773669579867; Mon, 16 Mar 2026
 06:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com> <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger>
In-Reply-To: <abgGnfO5ZrpOUza7@levanger>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Mar 2026 14:59:26 +0100
X-Gm-Features: AaiRm53TmmEldlbSbIxGsm46srTQKJN82jRa_BhGLUfrM1H32Pu13C6vCiHeFPY
Message-ID: <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
To: Nicolas Schier <nsc@kernel.org>, xur@google.com, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Teresa Johnson <tejohnson@google.com>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11956-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,gmail.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,vger.kernel.org,lists.linux.dev,arndb.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D19F729AEF5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 2:40=E2=80=AFPM Nicolas Schier <nsc@kernel.org> wro=
te:
>
> The simpliest solution would be to declare binutils 2.38 as build
> dependency; but I am afraid that it is still "too new", right now.

From the last bump at commit 118c40b7b503 ("kbuild: require gcc-8 and
binutils-2.30"), it seems binutils' minimum is supposed to go at
roughly the same pace as GCC's. Cc'ing Arnd.

Debian Old Stable has 2.40, so we would leave out Old Old Stable which
would have a recent enough GCC otherwise, so I guess that means we
cannot?

(I was taking a look at this minimum yesterday, because I was thinking
of removing the comment for a workaround related to binutils <=3D 2.36
in `Documentation/rust/quick-start.rst` when I bump the Rust minimum.
Of course, that comment is less critical, and those debugging a
Rust-enabled kernel likely have newer binutils anyway).

Cheers,
Miguel

