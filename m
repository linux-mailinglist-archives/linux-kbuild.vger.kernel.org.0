Return-Path: <linux-kbuild+bounces-2275-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAF691B0CB
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 22:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED732B23EA5
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 20:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6131A8C02;
	Thu, 27 Jun 2024 20:44:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B3C1A3BC6;
	Thu, 27 Jun 2024 20:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719521093; cv=none; b=RBpR9T8b/+1OirJxnHAZXJO/REE3KYYrAipdUUZJE9Ded9rfGnW4oQiXRUyaHql6p9WCiYn34cPdnltyZAkMfrbSROUvGB6SnhRgM+1plpvSWTRGRi1lBFKX+PniCUA5RwhV+ejD0xQxZYepLT13Nh8gCrv2KCjrHT0dSSTaj4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719521093; c=relaxed/simple;
	bh=LLl79xyUmSxvDDQb0rFblZjzQKy3uOIjEbcE7GTPJ6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdXbpfZFHMftJcCMmyKLPCCtQhoz1g6hpQtthNgsCTkHidGVaTYbLoUDcvy79qtoUC/1XKMQPqAMBOOSI0hp9xvMkk9SM6+FnS5GQ8NStp8j0U5cNKvfTCEsWCLkyR+MdV7ReUzX2a5D3dusxC3z0vogmVA2XeBzk+1l1P9f33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=54896 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1sMvyv-00ABVs-Ph; Thu, 27 Jun 2024 22:44:40 +0200
Date: Thu, 27 Jun 2024 22:44:36 +0200
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Mirsad Todorovac <mtodorovac69@gmail.com>
Cc: Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
	netdev@vger.kernel.org
Subject: Re: [PROBLEM] make randconfig: net/netfilter/core.c:830: undefined
 reference to `netfilter_lwtunnel_fini'
Message-ID: <Zn3PNGFkg6jqU9wc@calendula>
References: <7a472130-d9c4-4fda-840b-093308f73d3d@gmail.com>
 <Znc4931wlIgvqrfP@calendula>
 <6cdb1346-75ca-472e-8d96-d58a1eaab172@gmail.com>
 <b50bb0bf-4d35-4334-a721-2a092210aecc@gmail.com>
 <Znw78PpYwAgFZiaB@calendula>
 <3d7b5916-c462-49cb-af32-e43f6d6ebfec@gmail.com>
 <d3f8254f-0f53-47ee-a363-b14e9991a6e9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d3f8254f-0f53-47ee-a363-b14e9991a6e9@gmail.com>
X-Spam-Score: -1.9 (-)

On Thu, Jun 27, 2024 at 10:30:24PM +0200, Mirsad Todorovac wrote:
> On 6/26/24 20:34, Mirsad Todorovac wrote:
> > 
> > 
> > On 6/26/24 18:04, Pablo Neira Ayuso wrote:
> >> On Sun, Jun 23, 2024 at 12:51:49AM +0200, Mirsad Todorovac wrote:
> >>> On 6/23/24 00:48, Mirsad Todorovac wrote:
> >>>> On 6/22/24 22:49, Pablo Neira Ayuso wrote:
> >>>>> Hi,
> >>>>>
> >>>>> There is a fix on the table address this, I will submit is in the next
> >>>>> pull request.
> >>>>
> >>>> Thank you very much.
> >>>>
> >>>> Please consider adding Reported-by: Mirsad Todorovac <mtodorovac69@gmail.com>
> >>>>  
> >>>>> Thanks for reporting
> >>>>
> >>>> No big deal. Anytime :-)
> >>>
> >>> P.S.
> >>>
> >>> Please notify when I could test the same .config with your fix.
> >>
> >> Patch is here:
> >>
> >> https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git/commit/?id=aef5daa2c49d510436b733827d4f0bab79fcc4a0
> > 
> > Build error has gone, tested in the same environment. Please find the build output attached.
> > 
> > Tested-by: Mirsad Todorovac <mtodorov@69@gmail.com>
> 
> Apology, please, the right email is this:
> 
> Tested-by: Mirsad Todorovac <mtodorovac69@gmail.com>

Thanks a lot for testing.

Patch is already flying upstream, I missed adding this tag. But I
could include your Reported-by: tag.

