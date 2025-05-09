Return-Path: <linux-kbuild+bounces-7055-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3025BAB0D12
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 10:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E6523BDD48
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 08:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84795270ECE;
	Fri,  9 May 2025 08:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cohens.org.il header.i=@cohens.org.il header.b="ht/lT60t"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lemon.tzafrir.org.il (lemon.tzafrir.org.il [95.142.162.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1EF22A4FD
	for <linux-kbuild@vger.kernel.org>; Fri,  9 May 2025 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.142.162.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746778953; cv=none; b=GFoMyiJcLMfQu0SWdCMC6gyf0eYiPj8ikZiX+MdJDaRRzysKxXXG847pPW+ib3HBm43o9lWh3Ciz7cdEa5NMY1CUgGE3MdBXZOTaLeW8eJQ64bfZUYEKyFBsJFWj+MapzsdM+nl1mLm3wex/GuZ+7m7oUL0RVlDQ4xCXmkGFkM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746778953; c=relaxed/simple;
	bh=eAaotrf7eil5Y/WK0DWHGTzY7wMKPyaTsb4C9ZNLF4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pxrim8lQC41CPAJBgOvpSX4si2IWH+jch87Y5jVIZ9YSuD3ZzAKpjBM6bK7yN5BiTbSlkgQ5Upyi5C1OJ/r2z+qQNoPo8zKzjAwGrZ/L1Bdr1rF0xkA22vAggd1lAOpmWT8jz9GTo+UkeXSvM9eijjGI97VyTokkjADblE5LhPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cohens.org.il; spf=pass smtp.mailfrom=cohens.org.il; dkim=pass (2048-bit key) header.d=cohens.org.il header.i=@cohens.org.il header.b=ht/lT60t; arc=none smtp.client-ip=95.142.162.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cohens.org.il
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cohens.org.il
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cohens.org.il;
	s=default; t=1746778594;
	bh=eAaotrf7eil5Y/WK0DWHGTzY7wMKPyaTsb4C9ZNLF4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ht/lT60t164EktrwBWswjcwkKG6xoaQvZbI+m5Xmis6lihL56KjR7I2oDd3pozGTY
	 KaaaXbWdApAYisYyY9Cl9V+phiUgRmmhtr0QoltUsjixQiT77WEz0N3nqn4B4sWKZJ
	 wdaStqFbke1FGk8oUDdovwg+gEXE7x8ahDnMm/yXmlAGhPPUB9zLqaj1+RqAAEy7H+
	 7Dq6dgmsW6sDkduHnvcVTC8jTYofhftamQA7+IUUgD3l2r3qE2/cQ+mcLjmQU4J7mi
	 8QCHa7bb2j2B3ZFLFS9JHMXPVg7LtLGC9c0uD0pkgWFgc3SaEdswWeGTAQ8oqbSbpM
	 jsrPenwg5094Q==
Received: from malaclypse.mth.mellanox.com (unknown [10.2.0.10])
	by lemon.tzafrir.org.il (Postfix) with ESMTPS id 3B3D381E;
	Fri,  9 May 2025 10:16:34 +0200 (CEST)
Received: by malaclypse.mth.mellanox.com (Postfix, from userid 1000)
	id 7456782F8609; Fri, 09 May 2025 11:16:33 +0300 (IDT)
Date: Fri, 9 May 2025 11:16:33 +0300
From: Tzafrir Cohen <nvidia@cohens.org.il>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: rpm-pkg: Include symvers in kernel package
Message-ID: <aB254dkoxyncLI3V@malaclypse.cohens.org.il>
References: <20250407105857.2568209-1-nvidia@cohens.org.il>
 <CAK7LNARW4agbd7cW9BvDhrKYP-nxm3o===C57JZAwiFOi8+xkw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNARW4agbd7cW9BvDhrKYP-nxm3o===C57JZAwiFOi8+xkw@mail.gmail.com>

Hi,

On Wed, May 07, 2025 at 09:20:05PM +0900, Masahiro Yamada wrote:
>Sorry for the late reply.
>
>To align with Fedora's kernel.spec file,
>is it better to use 'compression' macro etc. ?

Yes, looks like a better idea. I guess we may maintain our own change for
Centos8 compatibility (overriding just those macros).

-- 
mail / xmpp / matrix: tzafrir@cohens.org.il

