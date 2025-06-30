Return-Path: <linux-kbuild+bounces-7758-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A42AED266
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 04:25:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A23B7189306F
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Jun 2025 02:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CF5634EC;
	Mon, 30 Jun 2025 02:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N015w0ij"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FDA35950;
	Mon, 30 Jun 2025 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751250323; cv=none; b=o19m5Oca/xbHQx2hMiYnFMiBg8wI5kw3OYAGnChc2lTtI69gYyPpa8bRK9q4OpbF4ny/ONSLlX6uepK0TQMWc/4SPXhzRva5j8ttKOFZu+GcqZMQb6A+FrvcvhsRAobhpkdauQXOMTVbYqaCtQCPHmw/RAMbGL42wTlOpVWMbkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751250323; c=relaxed/simple;
	bh=PWcp9I/7wvScSS6/5VY+ppz/g1EkHrikkwU/m9OSGfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qvN9zwNJ6hmEemsjozMRLO6XVq3k7K2jHcA660yZ7tTwsh4n8Y0Rrm6BqxNuUcCoXkz0lfcdydIM7XkY9V1BSpAqrywyvhAF4Qon3g4ZXxHs5PtkfRcmfDKafxXYsnV7Ihz66KpZqFFTvzfYREyOt7Lcxehfek/Shx4uot28o1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=N015w0ij; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Mgo59Ps4QW45AbB3IJs8iwnrlhFBKq+TOkgdgmTNINY=; b=N015w0ijOLMz5fhJ3g43kgmZf7
	qT3avWeixAdB8GSi8oVn3cIOGJxpqMfcI+TADb0VY8vMLgxSBL9t8LJUXhIX8HZu01ql0fJIkLzda
	2MvPIGgsTF5/eRoTtk9j7+E0qdxZwCuePuJ256wyWB2Waxpcu4pihfceRB6x0491D+dWYaLVePJhF
	IrhRB8jB4jWrdFX1sMybEczVvmcyMmodsjwjQUv/2cB3CkJl9M2oLH14FfOlG1WnX+UPzzOADczVx
	joVOuV9IUU0gncEtzAN7pQ7Qc7JX9QFS9u75FEdMS9UKFAt+OOebTfYxaPBJeRc8cmxCBFJdRTK4N
	QczKW84Q==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW4Cp-00000006iDl-42gZ;
	Mon, 30 Jun 2025 02:25:18 +0000
Message-ID: <12ae43a7-f5c5-4df7-8a83-41e35228e710@infradead.org>
Date: Sun, 29 Jun 2025 19:25:14 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/66] kconfig: gconf: remove empty if-block
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20250624150645.1107002-1-masahiroy@kernel.org>
 <20250624150645.1107002-11-masahiroy@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250624150645.1107002-11-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/24/25 8:04 AM, Masahiro Yamada wrote:
> This if-block is empty.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
> 
>  scripts/kconfig/gconf.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
> index b2a0208b0a5f..7960c456e3b9 100644
> --- a/scripts/kconfig/gconf.c
> +++ b/scripts/kconfig/gconf.c
> @@ -913,8 +913,6 @@ on_treeview2_key_press_event(GtkWidget * widget,
>  			gtk_tree_view_expand_row(view, path, FALSE);
>  		return TRUE;
>  	}
> -	if (event->keyval == GDK_KP_Enter) {
> -	}
>  	if (widget == tree1_w)
>  		return FALSE;
>  

-- 
~Randy

