Return-Path: <linux-kbuild+bounces-9413-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A48A5C34AE2
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 10:06:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B927D1886303
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 09:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DA42F363B;
	Wed,  5 Nov 2025 09:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="rZp61F/3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA272EDD7E;
	Wed,  5 Nov 2025 09:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762333473; cv=pass; b=J9QLarCSuhATNTznypvYdKzQzZx9ngiso28wP3CX/4g7jPMexNbHq/MnSVVx72epYLfl0rsUQIt9G3R79Zk8DiE/sxJG26JqS4cPFQc4iiKfLal+eYbR9DoRwWN32CdpTsqYiKPikU8OiYyGfDE9NLwfx2Xyd8jGerop/dLj1qE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762333473; c=relaxed/simple;
	bh=MppGKmeC707i9Qv+ovjV6up8fZEpVmmnNOXOn4z8PdE=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=L31KBAWXTKnN9Ng/ZskD581Yo0amOpJShHRjgBDsp5XjLudw9OUA13c3sFJImMdSt1RrOgwQtTq/O0gBsYbKCOLaFw9/AChPOml4bohaOzAfTrpEpP9t+ta8KdOk3LIEmNDvCVKUGm+mgQoCyQ2gIVsvCLjnvaztvfVfxR4trjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=rZp61F/3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1762333445; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TDfm0qbDt/WjjFGK5XF6uE+JkuK6m9J25/OMW035H5FJz83Y2NRRXsH5jNnrhkMWvhpojzHeVC94WDexBnORT1kSwZUWXJlZE+SD+DBztfv6bqGNQGBWK5qZnOPMnnvd1AFjIcNHAaDLa9PBzUJMj6CMBeiFvrD68mG5FwdnQYU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762333445; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=mfxQ9qxBrPibPlB+pt0Dx+bE8mzzHdP+eEf3wlBGPWA=; 
	b=PlYwBd9Ifflac0/P63z3kHUcejY2QjEy7+X0dMuVYKGe/PiG1EA+Hzok8U/PXPK/v10bxzDevbjD38jGBXfnjHXYLWY6CG5FiBPSqXsiApGk9hDumtKcLXKMXrBZWCRMPY2BlurgKvjNSdxbR5urUEEN8xMjb+dl1MR/VjBqq04=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762333445;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=mfxQ9qxBrPibPlB+pt0Dx+bE8mzzHdP+eEf3wlBGPWA=;
	b=rZp61F/3nE6+bqAi2ogyFvzX/qNmbU+8iquSYPPgjTxKnpn9Amx39llX5VnVuLCg
	ZpBHoWZnXRlyXhsg3cKuz8K9dTsQbZCzONB1FhGpzRvWzUK6nLySh9zEug7nFeMOXW2
	8DbtDM1PDlXdZcZHfs/zQhh0YxmA4Vkv5u0zquLc=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1762333442989835.1113157504799; Wed, 5 Nov 2025 01:04:02 -0800 (PST)
Date: Wed, 05 Nov 2025 17:04:02 +0800
From: Li Chen <me@linux.beauty>
To: "Kees Cook" <kees@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>,
	"Nicolas Schier" <nicolas.schier@linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-hardening" <linux-hardening@vger.kernel.org>,
	"linux-kbuild" <linux-kbuild@vger.kernel.org>,
	"Dan Williams" <dan.j.williams@intel.com>,
	"Peter Zijlstra" <peterz@infradead.org>,
	"Bjorn Helgaas" <bhelgaas@google.com>
Message-ID: <19a53424397.26d1e5f01471331.8175059524177790573@linux.beauty>
In-Reply-To: <20251105084733.3598704-5-me@linux.beauty>
References: <20251105084733.3598704-1-me@linux.beauty> <20251105084733.3598704-5-me@linux.beauty>
Subject: Re: [RFC PATCH 0/2] Add cleanup_plugin for detecting problematic
 cleanup patterns
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

+Peter, Dan, and Bjorn

(My apologies for the oversight)

 ---- On Wed, 05 Nov 2025 16:46:55 +0800  Li Chen <me@linux.beauty> wrote -=
--=20
 > From: Li Chen <chenl311@chinatelecom.cn>
 >=20
 > Hello,
 >=20
 > This patch series introduces a new GCC plugin called cleanup_plugin that
 > warns developers about problematic patterns when using variables with
 > __attribute__((cleanup(...))). The plugin addresses concerns documented
 > in include/linux/cleanup.h regarding resource leaks and interdependency
 > issues.
 >=20
 > The cleanup attribute helpers (__free, DEFINE_FREE, etc.) are designed
 > to automatically clean up resources when variables go out of scope,
 > following LIFO (last in first out) ordering. However, certain patterns
 > can lead to subtle bugs:
 >=20
 > 1. Uninitialized cleanup variables: Variables declared with cleanup
 >    attributes but not initialized can cause issues when cleanup function=
s
 >    are called on undefined values.
 >=20
 > 2. NULL-initialized cleanup variables: The "__free(...) =3D NULL" patter=
n
 >    at function top can cause interdependency problems, especially when
 >    combined with guards or multiple cleanup variables, as the cleanup
 >    may run in unexpected contexts.
 >=20
 > The plugin detects both of these problematic patterns and provides clear
 > warnings to developers, helping prevent  incorrect cleanup ordering.
 > Importantly, the plugin's warnings are not converted
 > to errors by -Werror, allowing builds to continue while still alerting
 > developers to potential issues.
 >=20
 > The plugin is enabled by default as it provides valuable compile-time
 > feedback without impacting build performance.
 >=20
 > Li Chen (2):
 >   gcc-plugins: add cleanup_plugin for uninitialized cleanup detection
 >   gcc-plugins: cleanup_plugin: detect NULL init
 >=20
 >  scripts/Makefile.gcc-plugins         |   1 +
 >  scripts/gcc-plugins/Kconfig          |   6 +
 >  scripts/gcc-plugins/cleanup_plugin.c | 204 +++++++++++++++++++++++++++
 >  3 files changed, 211 insertions(+)
 >  create mode 100644 scripts/gcc-plugins/cleanup_plugin.c
 >=20
 > --=20
 > 2.51.0
 >=20
 >=20
Regards,

Li=E2=80=8B


