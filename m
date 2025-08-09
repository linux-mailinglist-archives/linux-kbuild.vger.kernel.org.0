Return-Path: <linux-kbuild+bounces-8329-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 054CCB1F621
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Aug 2025 22:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A06783A8D00
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Aug 2025 20:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70572276031;
	Sat,  9 Aug 2025 20:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iIi27XFV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9944727510E
	for <linux-kbuild@vger.kernel.org>; Sat,  9 Aug 2025 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754770326; cv=none; b=laTB8Sa6P0zQ8spO9+h0z6zp10Oz/thWUDGTfd36r+RVvn715MazNLso8Kytwpkp11CqWCkj9n//4BY8sXZQcbEZeXLKPGfwLQGvO+nPPHLqBuKFzFlvFa7aP9rPKj7BUm1DLJgT54n0+wNKicoRNXwD/ZUA9kabF9JDktks6Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754770326; c=relaxed/simple;
	bh=htxIgMtHJjhFXVUol1rQhdEq0fGS9do9VIXjFTJQugQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bhPO2EzDJLieHzcbtsKg6TMQlvkhstgthaxSbGnPfBXDs5tciPL2Rn6errHWHcaNaG91/f9WpsZF6h5aHjHtNWrQ+WGQaN1vwDKBkUPXVAv/OATpvmXwnr2sRD+AYMcvYkCBrSBgxoi05C+yBctanA7cs1ohjjtnke5UD2+Hv4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iIi27XFV; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Sat, 9 Aug 2025 22:11:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754770321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=htxIgMtHJjhFXVUol1rQhdEq0fGS9do9VIXjFTJQugQ=;
	b=iIi27XFVZpG4wiaoEq+LqA1RbvnYg52Ea46jOzbNoC3UyWjgdDCxh2bVeGgxWryc+SMBsI
	6Hc2i3vpHu1ImY76sdbqmLPJRmsfLjfWoWcH+ASQUWrGPn6P71NA4TQ5jCPVl7O+vtNd0p
	vTJFEnV6eMxXR9pFv2Au5OlC+hjHhzQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <nicolas.schier@linux.dev>
To: "longguang.yue" <bigclouds@163.com>
Cc: linux-kbuild@vger.kernel.org, nathan@kernel.org, masahiroy@kernel.org
Subject: Re: [PATCH] Makefile: mrproper deletes signing_key.x509
Message-ID: <aJerjQGmXXcpTtBB@fjasle.eu>
References: <20250809120405.22957-1-bigclouds@163.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809120405.22957-1-bigclouds@163.com>
X-Migadu-Flow: FLOW_OUT

On Sat, Aug 09, 2025 at 08:04:05PM +0800 longguang.yue wrote:
> deletes temporary signing_key.x509 and reserves user-defined x509.genkey

can you elaborate the actual problem with some more details?

certs/signing_key.x509 is removed during 'make clean' which is a dependency
of 'mrproper'.

'mrproper' is meant to remove everything that might influence a subsequent
call of kbuild for the sane architecture.

Without further details I cannot see any problem here.

Kind regards,
Nicolas

