Return-Path: <linux-kbuild+bounces-3613-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D520F97BEB3
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 17:37:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECBD41C218F9
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 15:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7968D1BD4E2;
	Wed, 18 Sep 2024 15:37:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4D313667E;
	Wed, 18 Sep 2024 15:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726673828; cv=none; b=uXDDV/ieTjh1l74rdKIswlg6J0R5JT3+63LSuZPY1R8H7HThr26EcuduGaiFbV55bkd51a1SZSGOrUezNB1+UB3UDwsijYg/sJWYlkYfSeRck5bN1yU4JJuJjU5LslZ5X69SOL9MJiYvoOg//CwJytijKkWyw0cd38TJGTkK+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726673828; c=relaxed/simple;
	bh=F5pPLbFwSN/7LkXTc9oqQPIaqBamJ2hOis0OVx3G4qo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TMitvzjVqmHOMJQwzt248I/7JyTEqPlsivcMb6FE611fH42yawwEYMA5mp1mUdPqrWDPCQayiAgPyq/5CkT3N3WRoG10cCjEHJo2Pg0I2PjnlbfNFpzfP093EvzMvlCcL1QQ/hwPA/kevBreHNZR6Pfz8hn2bMd6q94ecAedP9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu; spf=fail smtp.mailfrom=fjasle.eu; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=fjasle.eu
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [IPv6:2001:bf0:244:244::71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 18 Sep 2024 17:36:00 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 6093280174;
	Wed, 18 Sep 2024 17:36:00 +0200 (CEST)
Date: Wed, 18 Sep 2024 17:35:59 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 02/23] kbuild: doc: remove description about grepping
 CONFIG options
Message-ID: <ZurzXxdFb4RYGeZG@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-3-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-3-masahiroy@kernel.org>
X-purgate-ID: 149429::1726673760-0B63ADC4-5E4E5A06/0/0
X-purgate-type: clean
X-purgate-size: 443
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean

On Tue, Sep 17, 2024 at 11:16:30PM +0900, Masahiro Yamada wrote:
> This description was added 20 years ago [1]. It does not convey any
> useful information except for a feeling of nostalgia.
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=65e433436b5794ae056d22ddba60fe9194bba007
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Reviewed-by: Nicolas Schier <n.schier@avm.de>

