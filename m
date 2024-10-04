Return-Path: <linux-kbuild+bounces-3916-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C655990F76
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 22:00:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3371B283168
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 20:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE5481F8918;
	Fri,  4 Oct 2024 19:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="BLPC8FrP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D3B1F891E;
	Fri,  4 Oct 2024 19:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728068560; cv=none; b=ZJMGEHMrwcfbKpf1g+zrThvLm+aqsiX+9Tw1tCh0DNBXsonWupW7jUHOXQVWgetd8mDu3BKPi9otB8Og/35ahfi2HfZh5/RtqfXepLGEXKSUo6qratfqpJaQ84tHhf+T6zTmwe2jxQCwd4g9TBp9+UxksiYwsaKqnTrh1iAfc5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728068560; c=relaxed/simple;
	bh=8cPfv1CMzvFTyW1STkPhWYztPeK4NqLJWODU2BD8IEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=amBe0M7nVxYTBimmkga0tLcEUNLWJ3pm1skU0+OcHpcN8K9FsutJS3j2Rx57TTstmfb9gNZ1u37H92iKufvfBb+mTf+aB6qYMPYxAv9XXLoK3j8DFoYl8UH4+KayIFGDZVc20p6GahS52vO4cXmg6IJmgEXWemZWZXiF2OlAkQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=BLPC8FrP; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ivQY6V/u0jBvC6PqC9zx+ri2q1Em0IGwsgDgYmQ9PlQ=; b=BLPC8FrPnzm5nF+tH3QUqt1EHj
	h5x5/F7MhWDL+JcW0KwnaTBfpnMymP2ZiPEffJ+LgkP32NkeQnxqo9voz5pIC1bBWcQqU8LGRdnNY
	STeAhM5sgBXgJtRiIEdx8rS0nSxlw8TrrNY7LWdOkUqntHkNbIFxFN2ESMXKmICFckNJpgy5OJa2i
	nbf0FinfPQGdJ32OtR5wj6WBgyruUshAznxTyAUZmtLTVMj8Zsc8ZSUOyfu/5qCx3SaEkCyeUcixn
	TmnHJ2N649IAjScSxIabYc3eEw31Q7VSp+2J4Ht05+dYp3f2lf9qy9LdA0k3gIILspmjNMJoRmPtD
	lRMsG8hw==;
Received: from [2001:9e8:9c9:1501:3235:adff:fed0:37e6] (port=57150 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swnZK-00Cp6k-Rm;
	Fri, 04 Oct 2024 21:02:26 +0200
Date: Fri, 4 Oct 2024 21:02:21 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 21/23] kbuild: use absolute path in the generated wrapper
 Makefile
Message-ID: <20241004-impressive-chowchow-of-charisma-9c5e6b@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-22-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-22-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:49PM +0900, Masahiro Yamada wrote:
> Keep the consistent behavior when this Makefile is invoked from another
> directory.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

