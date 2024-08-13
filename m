Return-Path: <linux-kbuild+bounces-2969-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AF4950DBB
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 22:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A64DB253D0
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2024 20:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DBA1A38E0;
	Tue, 13 Aug 2024 20:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="RQAqjFuW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21FC187F;
	Tue, 13 Aug 2024 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723580333; cv=none; b=hUeXPz5CuOQ5M/CZVxsZmq2lulRt0lU0Z8T2qW0vnymKrsqF5Dm7AQeZRpb7eGVXdK9qxx6RR5gw3lhBDc59M8kr6ffV4pJ+HdjNw/9vkzuTCGY8iA0CQv5fTgI6azLObDi9c9EOVvR7tD6oREMeKJHBPevotiS/V9U08H6nGkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723580333; c=relaxed/simple;
	bh=GTLogVUg6GAviFJ3mnMScW9ltf/aS6E7T3u3tkMuj14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Josk4wKJJJd61/hidOddme0clzfg2Hx/FPhMG6R2dhhWyiwpv68sEGKNUeHaw+QcbL7PzXvjpo251D/IdSC7tKgjcVUhgEhuUlE/zbXkPAxMAJrynOKJO05VVVxtJ+8RD5ZZwUfZI9XgRZFx9Ak+pdocoCKPBJeO8jK2NM9Cu3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=RQAqjFuW; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1723580320;
	bh=GTLogVUg6GAviFJ3mnMScW9ltf/aS6E7T3u3tkMuj14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQAqjFuWJR0B0NCsMQkM3vN448NoUQVRsoyO4usJv6er5LlGThz+9OwX936+Kk0rL
	 EWsnHf9oa2wZ4ZqWCu2TcaQJEtlNcoyNmbcswzNaqen8bgeupB/AgBKkRbd5KUfv+P
	 7x+4s4l7nCsfMrSBUYPOzxNvt7v5vUZ5bSGfy6qk=
Date: Tue, 13 Aug 2024 22:18:39 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jose Fernandez <jose.fernandez@linux.dev>
Cc: Christian Heusel <christian@heusel.eu>, 
	Nathan Chancellor <nathan@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Peter Jung <ptr1337@cachyos.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3] kbuild: control extra pacman packages with
 PACMAN_EXTRAPACKAGES
Message-ID: <58f7f3b7-3f75-482a-b1a5-0d701a6e5dc7@t-8ch.de>
References: <20240813011619.13857-1-jose.fernandez@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813011619.13857-1-jose.fernandez@linux.dev>

On 2024-08-12 19:16:19+0000, Jose Fernandez wrote:
> Introduce the PACMAN_EXTRAPACKAGES variable in PKGBUILD to allow users
> to specify which additional packages are built by the pacman-pkg target.
> 
> Previously, the api-headers package was always included, and the headers
> package was included only if CONFIG_MODULES=y. With this change, both
> headers and api-headers packages are included by default. Users can now
> control this behavior by setting PACMAN_EXTRAPACKAGES to a
> space-separated list of desired extra packages or leaving it empty to
> exclude all.
> 
> For example, to build only the base package without extras:
> 
> make pacman-pkg PACMAN_EXTRAPACKAGES=""
> 
> Signed-off-by: Jose Fernandez <jose.fernandez@linux.dev>
> Reviewed-by: Peter Jung <ptr1337@cachyos.org>

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

Thanks!

