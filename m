Return-Path: <linux-kbuild+bounces-877-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CB28503DA
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Feb 2024 11:19:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DFE21C216A8
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Feb 2024 10:19:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A35536132;
	Sat, 10 Feb 2024 10:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b="EvHprzZS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.envs.net (mail.envs.net [5.199.136.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A3924214
	for <linux-kbuild@vger.kernel.org>; Sat, 10 Feb 2024 10:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.199.136.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707560353; cv=none; b=gf0BVNMQV8ZNYfYk1DAvQo1HwXByc0JgBrVe7jpffCKmWMAGEvQWqshql1Erb9b484tTa3zxvjafE9bWsbUHvh/w7w8sz1BBrWRDu4Ss63x2kvvpfZniMJTpbSO4GSXtwTukcXqNHBSkAjRzHE0dS928q6fO0K3XMP1eDSBA5ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707560353; c=relaxed/simple;
	bh=Byr6+lEWFPA0zPiqpL22kpOH4pbQ5ExMGmE/f1uOvmo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gYZQGTvnBto+8n/H2z8sXTegTKHnfY9UUeWDqQLi+Hdz1bYFPZULr8EXN1cAMnPA1hESohTKCOuuX+kLOwNS2+kpiWzVYerqfNr+UMKe787osUSSu3iPcH1PlGw0amof3T7tTP2V0NlviFoT4Dguh54AAbkqVIu83rz0gqcxySw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net; spf=pass smtp.mailfrom=envs.net; dkim=pass (4096-bit key) header.d=envs.net header.i=@envs.net header.b=EvHprzZS; arc=none smtp.client-ip=5.199.136.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=envs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=envs.net
Received: from localhost (mail.envs.net [127.0.0.1])
	by mail.envs.net (Postfix) with ESMTP id 5471A38A0669;
	Sat, 10 Feb 2024 10:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=envs.net; s=modoboa;
	t=1707560342; bh=LRL2PsA/aZaGBJJvNHDQC8hNpObzh1fpcd/CHOw0PmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EvHprzZS7HifFlyDqEGUNA+wCqEeLmWt8njtj6PIU90NGykd/vpXA8X2l1MMw7n3e
	 3zgLsYdztoMX+70E5+J692gHx4g8PNTbGOyIW68eHTDthslYeKYRfe+d8/IDu1pO+i
	 5pi20f415jJncNoCPQj8i2gkwUqUU8t9zWQsY0Wgi/2sS7y1t3XQ+xUKenCWLCZvbu
	 QkMmouEwkm00pw+6BXvZmO6UqOTrqzXxWxygtBQDm7t67r4eBunaAPO1hCq7+gh1VB
	 qGimemDGboU16BrXLoFN3iEWRo6dcPba9HY+YDqQU0V81r1h/UDL87tlc22kSWop3b
	 gYuNlUi39/DY8aDYG753GbElu1AFe4qNoehBDEXpfy0x1uZWOt8tDtyzw3toR0yTvM
	 9f7ERSAuD+j5x/eeJP+EJXyXM9trpwYtJAGyLTBAqx8KvYhIZOkEQcsRyujTIJ8p4G
	 K7XtrZvhI4JUyyFRVnQayung2JCQ4Ew+B7aiohrkcLahpUfTZUuaFiVYyRYB27kqBR
	 G7Flro8DFdpvIWC3Ukd5at/yeFsHO0uLCrEJSFs66VD/NKivsqlM93bNlGq4RbnIo5
	 pF2DGcLQb+5gvVIze1aX+pn0WscX8kXWMYrB7QuV1gSOsuuAkr9mqvYnTKEM1jGwZn
	 r6GFSWzyYQtzHJWdBSFyJGYQ=
X-Virus-Scanned: Debian amavisd-new at mail.envs.net
Received: from mail.envs.net ([127.0.0.1])
	by localhost (mail.envs.net [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7atlyEU71cqp; Sat, 10 Feb 2024 10:18:59 +0000 (UTC)
Received: from xtex.localnet (unknown [223.73.102.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.envs.net (Postfix) with ESMTPSA;
	Sat, 10 Feb 2024 10:18:58 +0000 (UTC)
From: Zhang Bingwu <xtex@envs.net>
To: Zhang Bingwu <xtex@envs.net>
Cc: linux-kbuild@vger.kernel.org
Subject:
 Re: [PATCH 0/2] kbuild: Fix install errors when INSTALL_PATH does not exist
Date: Sat, 10 Feb 2024 18:18:46 +0800
Message-ID: <4685272.vXUDI8C0e8@xtex>
In-Reply-To: <B99CF5DB-276C-4BBC-8D18-C1199BDA104B.1@smtp-inbound1.duck.com>
References:
 <20240210074601.5363-1-xtex@envs.net>
 <B99CF5DB-276C-4BBC-8D18-C1199BDA104B.1@smtp-inbound1.duck.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2128217.9o76ZdvQCi";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2128217.9o76ZdvQCi
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Zhang Bingwu <xtex@envs.net>
To: Zhang Bingwu <xtex@envs.net>
Cc: linux-kbuild@vger.kernel.org
Date: Sat, 10 Feb 2024 18:18:46 +0800
Message-ID: <4685272.vXUDI8C0e8@xtex>
MIME-Version: 1.0

Sorry I forgot to CC these patches to kbuild list.

-- 
xtex @ Sat Feb 10 10:16:06 AM UTC 2024

--nextPart2128217.9o76ZdvQCi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRyMYBLBSxnDxWmdx25GAhu2ARbkQUCZcdNhgAKCRC5GAhu2ARb
kZpzAQC9kPim9UkC9pUKLd+b9oY2U0GS8ZuRlbrLvnjUSm+rcgEAxCn/kzsNkVT2
dDH1TKd60k8DPzX+vQgXJexEQm/DxAg=
=PrjN
-----END PGP SIGNATURE-----

--nextPart2128217.9o76ZdvQCi--




