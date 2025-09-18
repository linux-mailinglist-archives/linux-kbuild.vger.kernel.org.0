Return-Path: <linux-kbuild+bounces-8388-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DD8B22344
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 11:34:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C8D6189CBFA
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Aug 2025 09:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981902E7F2A;
	Tue, 12 Aug 2025 09:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SGdgvqQs"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145942E62A0
	for <linux-kbuild@vger.kernel.org>; Tue, 12 Aug 2025 09:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754991089; cv=none; b=BQypR7UW87ZJYbeIFoj3XTu6Vhje4uwxSDVSBQAcZS6H/c8jRSrHuQilJbIY+OcRqaWIGmNZMNPjKrBZ7HyKOSdMlxu9Iy/Hpa6dH/nv+PBva6k5AbLC/8v4WsZUiLXph1VnpGzqIYyqxFj1nevm+MxRz+BojzUK1VWlBchk6Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754991089; c=relaxed/simple;
	bh=9LIDl5TmDZoCFehCeXVzEwk4riwJ6NxuZhgAir7SIYY=;
	h=From:In-Reply-To:References:To:Cc:Subject:MIME-Version:
	 Content-Type:Date:Message-ID; b=uq1ucUmomGjdTleEi93dCNFtf+vqFrF/C7UA9F0pN67Wel1+XOYIcjLhYir2W8AkKv46cuO+MHOwPWMb+k98YRLTR3pwBB80fydTd7K3avteb6/uqHb/ZTfw71mLcPD9DRTV3+pfhoITGSSofBxRoTWCG9aAoZo8oz/HMde3rRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SGdgvqQs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754991087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mzheIFnMO+JPZQtntC4jG7sL4Q6RgRAnfy5HtXTetY4=;
	b=SGdgvqQsuGX4WmaklIi5/J3mCiTDE/FTQuUwz2siofm1amIWqmTqTfJbh+Vawb4shwKVkX
	/Sop+Bp06B02PUP8GI55PlcFTXZJappQ1gMiWI6JoQlRJI0yp29GBAjEQjZesGA8ol4zu6
	jSYXMm9wEmXr/juvdTfEGHMc0I16n38=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-41-DWm7SZ0KN5WL82D4oUuGag-1; Tue,
 12 Aug 2025 05:31:20 -0400
X-MC-Unique: DWm7SZ0KN5WL82D4oUuGag-1
X-Mimecast-MFC-AGG-ID: DWm7SZ0KN5WL82D4oUuGag_1754991079
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A7881800378;
	Tue, 12 Aug 2025 09:31:19 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.42.28.21])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0A3CE19560B6;
	Tue, 12 Aug 2025 09:31:16 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20250811-diligent-rigorous-ara-e7a9d2@l-nschier-aarch64>
References: <20250811-diligent-rigorous-ara-e7a9d2@l-nschier-aarch64> <20250809120405.22957-1-bigclouds@163.com> <aJerjQGmXXcpTtBB@fjasle.eu> <1ac1d3e3.58ad.19897d159ff.Coremail.bigclouds@163.com>
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: dhowells@redhat.com, "longguang.yue" <bigclouds@163.com>,
    linux-kbuild@vger.kernel.org, nathan@kernel.org,
    masahiroy@kernel.org, David Woodhouse <dwmw2@infradead.org>,
    keyrings@vger.kernel.org
Subject: Re: [PATCH] Makefile: mrproper deletes signing_key.x509
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <650212.1754991075.1@warthog.procyon.org.uk>
Date: Tue, 12 Aug 2025 10:31:15 +0100
Message-ID: <650213.1754991075@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Nicolas Schier <nicolas.schier@linux.dev> wrote:

> 'make mrproper' is meant to prepare the source tree to be as pristine as 
> possible for the given architecture.  This includes removal of any 
> configuration file(s) that influence subsequent builds.  From kbuild 
> point of view, certs/x509.genkey is also a kind of a configuration file, 
> as leaving it in tree after mrproper creates different build results 
> compared to a build from a really pristine source tree.
> 
> Iff the certs/ maintainers think that retaining a user x509.genkey file 
> over a mrproper makes sense, then we should probably adjust the rule for 
> generating $(objtree)/certs/x509.genkey, e.g. by allowing to provide one 
> by environment variable.
> 
> David or David, do you have an opinion on this?

make distclean or make mrproper should delete the key.  As you say, it's
thoroughly cleaning out the source tree - it used to be so that you could more
easily diff it for prepping a patch, I guess.  make clean, OTOH, should not.

David


