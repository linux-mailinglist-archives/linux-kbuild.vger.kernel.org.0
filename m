Return-Path: <linux-kbuild+bounces-9415-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF660C35AFA
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 13:44:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 76FD83A74B5
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 12:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3155F315793;
	Wed,  5 Nov 2025 12:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="aZW7GAG3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8D1314D10;
	Wed,  5 Nov 2025 12:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762346539; cv=pass; b=pRv0WG+29oHZduZWooClFdVJKQSMbbKiDjpBSL7g6mQu+rRmnN3OSBnB3IjQNQsM/9QiXMiLXwapiWIQGquGChJDhWVF2HXc9VisfQfmztbcH0RH5JWeCxbZCigSo6+PpRsBnnaEUp2qGYJHAUzxiY3SbMjSw0bktG1UMcJXb0A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762346539; c=relaxed/simple;
	bh=T+mqXgxFpuLdLRbCoxR94vhutevJ5uNPTklPTzr1li8=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=k7DJmtlRwMT8UswQ7P+jqfzNlQUgc5uwkPI2hA3kea6Y4MGk8HWTJAZZS5/p6I8Ogq9ia1YK66Bkp61iUdjLDk0PgK1o2ylve4nhIlKdy2gAQpTgYlmzSAMhSb5orJAmI6Pm87mfkCZhMPU39w0P23X+Er5+r7ALDEyJ8ucCAeI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=aZW7GAG3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1762346523; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CT+lb2SyI1ylNuAdK9QT5mmY56WjeDWLh2NYex0Fii5rzvz9SnMew+ATHTQmCRBmQ8uzvy8wjj4Z/+YQhETOAgyF6U9QKeDmliHoDdRWpfp/quBVA79TO0FXchUDJ03tQjY/0PDch/0bQyg1Mdu9Y9CaP8k02NwHmW/c0wX8ggY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762346523; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=CqObBGu2WsyCYawJI/cjd9hX91dFgtxqhrF/3mbLMqo=; 
	b=VMynOv6vHFH6x84lFJa6sBBRZlNdRqV52VpNEuRV/yte5drKeK/M+gQSe4NZvqKS0+qxvruJF3alJQBcWOhOgEfNMRC0lJxpAlwKhyG5WOnkZAf6Cjl2i6SdvkTfiIqVEcceZBcMghJEkOr+NOpJmn/RlO2fC5JV+4Ni5SCyz1s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762346523;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=CqObBGu2WsyCYawJI/cjd9hX91dFgtxqhrF/3mbLMqo=;
	b=aZW7GAG3Fk9fa4ruSJoTs0COjavWlthtJt0/4dSjLqV4Xp3keNmg09G9vl04MPuP
	9OMX3oWuaPdPwxlVnOCnDQyMbBmRO8t7L3kw12ThKC7GvhTUw+3Xs+TGuz5Y3WK1pL6
	MKhBhX0MsizwUH4dY5qWJmnmBQN4nykDaadvXkjU=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1762346509276602.5493781665645; Wed, 5 Nov 2025 04:41:49 -0800 (PST)
Date: Wed, 05 Nov 2025 20:41:49 +0800
From: Li Chen <me@linux.beauty>
To: "Kees Cook" <kees@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-hardening" <linux-hardening@vger.kernel.org>,
	"linux-kbuild" <linux-kbuild@vger.kernel.org>
Message-ID: <19a5409a3bf.50871c0e1607989.1264040958211475507@linux.beauty>
In-Reply-To: <20251105084733.3598704-1-me@linux.beauty>
References: <20251105084733.3598704-1-me@linux.beauty>
Subject: Re: [PATCH 0/3] dm-pcache: built-in support and metadata hardening
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

My apologies, please disregard the dm-pcache portion of this series. This s=
eries will focus solely on gcc-plugin.

 ---- On Wed, 05 Nov 2025 16:46:51 +0800  Li Chen <me@linux.beauty> wrote -=
--=20
 > From: Li Chen <chenl311@chinatelecom.cn>
 >=20
 > This three-patch series tidies dm-pcache=E2=80=99s build glue and tighte=
ns the metadata scan.
 >=20
 > Patch 1 allow dm-pcache to be linked into vmlinux and avoids clashing wi=
th the sunrpc
 > cache_flush() by using obj-$(CONFIG_DM_PCACHE) and renaming the helper a=
cross the tree.
 >=20
 > Patch 2 drops a redundant recomputation of the metadata slot pointer whi=
le walking headers.
 >=20
 > Patch 3 zero-allocates a temporary buffer so callers never see stale met=
adata,
 > relies on __free(kvfree) for cleanup, and only copies back once a valid =
record is found.
 >=20
 > Thanks for your review.
 >=20
 > Li Chen (3):
 >   dm-pcache: allow built-in build and rename flush helper
 >   dm-pcache: reuse meta_addr in pcache_meta_find_latest
 >   dm-pcache: avoid leaking invalid metadata in pcache_meta_find_latest()
 >=20
 >  drivers/md/dm-pcache/Makefile          |  2 +-
 >  drivers/md/dm-pcache/cache.c           |  2 +-
 >  drivers/md/dm-pcache/cache.h           |  2 +-
 >  drivers/md/dm-pcache/cache_req.c       |  6 +++---
 >  drivers/md/dm-pcache/pcache_internal.h | 15 ++++++++++-----
 >  5 files changed, 16 insertions(+), 11 deletions(-)
 >=20
 > --=20
 > 2.51.0
 >=20
 >=20
Regards,

Li=E2=80=8B


