Return-Path: <linux-kbuild+bounces-9410-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCEEC3497F
	for <lists+linux-kbuild@lfdr.de>; Wed, 05 Nov 2025 09:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 05CA34F3FE2
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Nov 2025 08:51:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAB22E11D1;
	Wed,  5 Nov 2025 08:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="B1mDV8Ct"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AF72DBF4B;
	Wed,  5 Nov 2025 08:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332533; cv=pass; b=qbnk8cWSxtzUvYbWvwe8q7/1Z5UiAOIgE8I6InCDF9W4YKecMUJGl0b96thsawzWwqC4AZZPzVgMxmor/gtIzpfBIRAZvIiejO7umi/esdaynwR0niXVPOBD8CtgQiSeW0yUpfp9ImwYKHbuhpaGyK+/9NEXfnYnvLpmJ8hNX2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332533; c=relaxed/simple;
	bh=1zEZaPPfIvEl6XAYQkaxyHbG4DpjuTiC/+f5gyGcm5A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vDNQFWiqZyZceWP1In0WEAjLkA9exNLFF+FWia0OJBZt7iMQIxbTLo0gd6dxfCTST8R+XVLNSh7Yq94g4Br5rCI6YcKua+NUtn3CHk6955kJPlBHMrKZ1Ost8GnfmZ9nGbKpOiLJlmevl4tppffNCQAP32ab3C5b0UnVgmSaUCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=B1mDV8Ct; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
ARC-Seal: i=1; a=rsa-sha256; t=1762332477; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eB0XYghFh06s9GahQOg6G9qjgEW16Gvu5ZfDcDDCg6ETz6o9bPoP7wz2rmJS7rT8fYdB6Pf2xGie+nKQAOjQka5D7nLFP1nPFIsh+fJ5h1PXATYRtTZ3O8GhvLIdDVWHUhTqbPqFvo9Gult5s5DLgY0+yW6O8f3jRjGv29Zs+Ig=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1762332477; h=Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=/574By94Kh/X4PaVAuVUWEj34hcHHMjQhENaG+bXk7M=; 
	b=fSX9ZvI5Q3OCjGxe+JIZGsbBcOUg1GLVNCSKt4zin4w9r2fETyG+DaXOxiuYMGnDDCkd6F+sKK/VRKZxInMOKmZDUv+TNxmAE6rE4aP82hT1q/XLshelq7/jJzVoMvlgRCxcc/qZRERWKfMNQyTslzvkWAVnh1rYTZTeutSEk+w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1762332477;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=/574By94Kh/X4PaVAuVUWEj34hcHHMjQhENaG+bXk7M=;
	b=B1mDV8CtDFTmlxJxbCA8TOxK7Hrqxlyjy6K6uFME6BSYiKpDkrLufDmN/4l0YoK2
	Xzu1MoCMAUDyK31l8K8F0NB6Bhnyj+LJeB4M1+q1yO3H31QyhF2zC4dg8kKFtJsE00x
	w3Ag7liwqMQoCtsU95zrmGc7xLungJPXjyLi0y9E=
Received: by mx.zohomail.com with SMTPS id 176233247471619.3992800226398;
	Wed, 5 Nov 2025 00:47:54 -0800 (PST)
From: Li Chen <me@linux.beauty>
To: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: [RFC PATCH 0/2] Add cleanup_plugin for detecting problematic cleanup patterns
Date: Wed,  5 Nov 2025 16:46:55 +0800
Message-ID: <20251105084733.3598704-5-me@linux.beauty>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251105084733.3598704-1-me@linux.beauty>
References: <20251105084733.3598704-1-me@linux.beauty>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Li Chen <chenl311@chinatelecom.cn>

Hello,

This patch series introduces a new GCC plugin called cleanup_plugin that
warns developers about problematic patterns when using variables with
__attribute__((cleanup(...))). The plugin addresses concerns documented
in include/linux/cleanup.h regarding resource leaks and interdependency
issues.

The cleanup attribute helpers (__free, DEFINE_FREE, etc.) are designed
to automatically clean up resources when variables go out of scope,
following LIFO (last in first out) ordering. However, certain patterns
can lead to subtle bugs:

1. Uninitialized cleanup variables: Variables declared with cleanup
   attributes but not initialized can cause issues when cleanup functions
   are called on undefined values.

2. NULL-initialized cleanup variables: The "__free(...) = NULL" pattern
   at function top can cause interdependency problems, especially when
   combined with guards or multiple cleanup variables, as the cleanup
   may run in unexpected contexts.

The plugin detects both of these problematic patterns and provides clear
warnings to developers, helping prevent  incorrect cleanup ordering.
Importantly, the plugin's warnings are not converted
to errors by -Werror, allowing builds to continue while still alerting
developers to potential issues.

The plugin is enabled by default as it provides valuable compile-time
feedback without impacting build performance.

Li Chen (2):
  gcc-plugins: add cleanup_plugin for uninitialized cleanup detection
  gcc-plugins: cleanup_plugin: detect NULL init

 scripts/Makefile.gcc-plugins         |   1 +
 scripts/gcc-plugins/Kconfig          |   6 +
 scripts/gcc-plugins/cleanup_plugin.c | 204 +++++++++++++++++++++++++++
 3 files changed, 211 insertions(+)
 create mode 100644 scripts/gcc-plugins/cleanup_plugin.c

-- 
2.51.0


