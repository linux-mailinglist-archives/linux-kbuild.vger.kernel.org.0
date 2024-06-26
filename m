Return-Path: <linux-kbuild+bounces-2255-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E809186D6
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 18:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A8DFE1C2277E
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Jun 2024 16:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE71819007C;
	Wed, 26 Jun 2024 16:04:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [213.95.27.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB0618EFCF;
	Wed, 26 Jun 2024 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.27.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417854; cv=none; b=CVTKtA3O/nb6sI+/5+l2/DQWayBkHY76J3qb+b5Zc/enpqt9WdyuXqZ+QngI/rYKkoJwa1b+TPUv3IU1ngcNzl6IZMNkiJZveldAZO3C+64eoCWJzEtP6b5sSRE9W4uD6tuUIkd7YKa2yHNUaU7uhhaMIynJeAj5BegLbbcUvrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417854; c=relaxed/simple;
	bh=4O4CAULsJeXynfjY6mPTGWkKb6XikVyaPfbpdlls0Fc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLZtVlD/S5JzhDqZFNd3d4ShHHz3bTz1a2LXcsN8RqVKsQZBagKDTmhF5uvDBfekffo+0K+w+amEx/W4/pKjppeU2IytICYJmLt9PCgWbO8gJAriQW1BW4F6Nij09Vs/A1kzawTZfZT9Um0Q81gEWJsNgEkHkjsmGEKkJ+EhJN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org; spf=pass smtp.mailfrom=gnumonks.org; arc=none smtp.client-ip=213.95.27.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gnumonks.org
Received: from [78.30.37.63] (port=40636 helo=gnumonks.org)
	by ganesha.gnumonks.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <pablo@gnumonks.org>)
	id 1sMV7p-008D6r-J6; Wed, 26 Jun 2024 18:04:03 +0200
Date: Wed, 26 Jun 2024 18:04:00 +0200
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
Message-ID: <Znw78PpYwAgFZiaB@calendula>
References: <7a472130-d9c4-4fda-840b-093308f73d3d@gmail.com>
 <Znc4931wlIgvqrfP@calendula>
 <6cdb1346-75ca-472e-8d96-d58a1eaab172@gmail.com>
 <b50bb0bf-4d35-4334-a721-2a092210aecc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b50bb0bf-4d35-4334-a721-2a092210aecc@gmail.com>
X-Spam-Score: -1.9 (-)

On Sun, Jun 23, 2024 at 12:51:49AM +0200, Mirsad Todorovac wrote:
> On 6/23/24 00:48, Mirsad Todorovac wrote:
> > On 6/22/24 22:49, Pablo Neira Ayuso wrote:
> >> Hi,
> >>
> >> There is a fix on the table address this, I will submit is in the next
> >> pull request.
> > 
> > Thank you very much.
> > 
> > Please consider adding Reported-by: Mirsad Todorovac <mtodorovac69@gmail.com>
> >  
> >> Thanks for reporting
> > 
> > No big deal. Anytime :-)
> 
> P.S.
> 
> Please notify when I could test the same .config with your fix.

Patch is here:

https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git/commit/?id=aef5daa2c49d510436b733827d4f0bab79fcc4a0

