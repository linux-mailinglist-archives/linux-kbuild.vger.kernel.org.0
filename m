Return-Path: <linux-kbuild+bounces-6882-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31848AA7522
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 16:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 986C0171681
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 May 2025 14:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0412561AA;
	Fri,  2 May 2025 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZFJFLhIo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4BA255F40;
	Fri,  2 May 2025 14:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746196752; cv=none; b=eTTBTKd4xZhwtwAcjejFRIn3Cxl0hBb/gKz/dhkEPnlBTB8m2Kgt2lUgn58GUOfkZ3YL8faoHYqb6PtTT9yze2sPR5ON+jd8UJSAxaxL8J/Bxar9xznBXsrOv8cwlasHDLtgpq97l71wGQZCdY/DstGvD4+ni83SM8szsl4NXXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746196752; c=relaxed/simple;
	bh=XESE8et9yQopOBZshLWaY4z5a6M2no8sBmkUydfULY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iqf70AAPXR2gEoxpISRyifM2avXre84wlEGw/9Y9o4CA/kNxn2WmbueGa+JQCEXTwTxFtwFb0wVGDop6U0Tt+NbNJnADJ1XZXgSgf6spqUnfQIlNI6G9jnA2MlRarvV+HtTQCCqDRRKjiU0oPPtefzdo4LxoS/4LfUm0M4C7NLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZFJFLhIo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B95DC4CEE4;
	Fri,  2 May 2025 14:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746196752;
	bh=XESE8et9yQopOBZshLWaY4z5a6M2no8sBmkUydfULY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFJFLhIoc344R4uRMsGIUo/O6BxZXKAdmwCB3GzANjj9ZmnQmHvL2OgjmzBTcfPjC
	 pIYaAtgseAthHPsVfzdvG/a0RNKRNVei6KMUz1YctSZ2tH64QOUZx+vjS6gxZyMcq+
	 II+HLUnjouBL7B02LapZIC2ou43smHlANZfnXwy4=
Date: Fri, 2 May 2025 16:39:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mcgrof@kernel.org, x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, roypat@amazon.co.uk
Subject: Re: [PATCH v3 0/5] module: Strict per-modname namespaces
Message-ID: <2025050259-reappear-apostle-d176@gregkh>
References: <20250502141204.500293812@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502141204.500293812@infradead.org>

On Fri, May 02, 2025 at 04:12:04PM +0200, Peter Zijlstra wrote:
> Hi!
> 
> Implement means for exports to be available to an explicit list of named
> modules. By explicitly limiting the usage of certain exports, the abuse
> potential/risk is greatly reduced.
> 
> Changes since v2:
> 
>  - switch to "module:" prefix (Masahiro)
>  - removed some patch noise (Masahiro)
>  - strstarts() and strlen() usage for prefixes (Masahiro)
>  - simpler ___EXPORT_SYMBOL() changes (Masahiro)
> 
> Not making using of glob_match() / fnmatch(); this would result in more
> complicated code for very little gain.
> 

Nice work!

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

