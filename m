Return-Path: <linux-kbuild+bounces-7800-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15BBAEEAD2
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jul 2025 01:14:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42B3317ECCA
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 23:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E105428EA44;
	Mon, 30 Jun 2025 23:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AXGGC7D8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C7F1F2BB8;
	Mon, 30 Jun 2025 23:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751325257; cv=none; b=fnKwU8v5FWkodKrboD64sUqTqK160Xfhwqy4I+DPLgOhEEN2UAHsHq5j98oWvv8aG+1U7DDsgbxS5OokRDeGJ5AXJHO4xho5WsOVNAi1m/JND2MIn+sxeY0v7NgUv/XmkZOshPFkbfZi9Bjilnrsi6eEZZZsI0qzke0csPgFGEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751325257; c=relaxed/simple;
	bh=dCcSYbP9LU3g449P7EceWOV7IVHllQ/JnJMfo9EXFUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFCtcQ9mWiseaG2YxcGB2jmMEks7OI/BqLb9ChShCutcbCSqg4xj+47ZM0Q7t37/5O08znvJVvuTqawpHxM7sL1F1FIc3SB7UF+VJQInmxIsudd5LxhsWKWSO8IhED1yoIPoJOlbIN87D/3WGuaMaXhRTWFofujLU3YHzqg0i3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AXGGC7D8; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WeRwUexG47hoUwNlnEWCrGXohGOLwRdGkMYIn9kzPg0=; b=AXGGC7D8GQVFXlPQP8itceztGk
	OTCPaP5ZdbtwnuL+LmlHOf9zGN08DLZHkXIZPCzyjYI1Ze5gPFumCVJqnuMzSnzPypnWfZye209al
	MdhzbTFmH1KSN0HIJY0YQuraHIkSngn8XmHHpX7L8esxALVzJC69PRLchkKLROw2pFiYXVgzq+bIu
	nI4w+isqdYFZo3rc6EV6rDRT0bqTfQdtubE5XC+sfigQrbHJu2yCs+1bqXSTs3dSYjFCMxE1znTJ4
	yjXSU0yYioUBEiQwhynQhGI92LyQaOIuCL9VOTxdT2AjaTCRm5p9XkHF9j5To3pvBtZ0yJJSmck2i
	6GCFUdQQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWNhW-00000006u4O-0bAM;
	Mon, 30 Jun 2025 23:14:14 +0000
Message-ID: <f8874d60-ce05-41f1-a04d-5b216ca61cf4@infradead.org>
Date: Mon, 30 Jun 2025 16:14:12 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] kconfig: gconf: migrate to GTK 3
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250629184554.407497-1-masahiroy@kernel.org>
 <20250629184554.407497-6-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250629184554.407497-6-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/29/25 11:43 AM, Masahiro Yamada wrote:
> This commit switches from GTK 2.x to GTK 3, applying the following
> necessary changes:
> 
>  - Do not include invidual headers
>  - GtkObject is gone
>  - Convert glade to GtkBuilder
> 
> [1]: https://docs.gtk.org/gtk3/migrating-2to3.html
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
> (no changes since v1)
> 
>  scripts/kconfig/gconf-cfg.sh |  11 +-
>  scripts/kconfig/gconf.c      |  70 ++++++------
>  scripts/kconfig/gconf.ui     | 200 +++++++++++++++++------------------
>  3 files changed, 135 insertions(+), 146 deletions(-)

-- 
~Randy

