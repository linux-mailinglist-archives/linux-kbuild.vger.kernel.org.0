Return-Path: <linux-kbuild+bounces-12702-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHLVB7Js1GmatwcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12702-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 04:32:18 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B77A23A918F
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 04:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C462D3032069
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 02:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35387364938;
	Tue,  7 Apr 2026 02:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aZYGtkOq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZS1FUI2o"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEA536405D
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Apr 2026 02:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775529074; cv=none; b=j8+ovcPDK5SyW4VngF1KESmdBOLNB9EDA/5E5bUBi7+BbPmFUCs3FuBkWViU/i5EJF9JL20y+f5QmKIgyV0J3MssZFTbnb+HzMQ8nStnqi8Bg3SGdiQnV6W4DOp6Q+/19N0yo6c+1lNSlxhg/wW6L0sOjfC8xwklGgM1wDI3rF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775529074; c=relaxed/simple;
	bh=AS7Co8RyS/RWpa1/YRQO4aU8nxHDrQCiF5/Dyfytx/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uk2vsJbspmIhVF4FV6HJ8fJZF3n9fI9cDLrNyKnGhOJd23dZSVxi4z0nBT83klzu0EWz0dopObAoua0imDXG1828zpBlhIIFpWXr4WG+foBM8RBfVIa3smOPlO6mb5jY3M9kyELht+zbMGwNc754cOu0Oxl6Th5Gh/WDVG0Rcys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aZYGtkOq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZS1FUI2o; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775529071;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+relXseHSDiLD/cBAI0rxB8yeQocHqRAcYJEZB5dGtk=;
	b=aZYGtkOqx6MU2mPyIh8tcbZNM/Cnp2snKAi+6uosFgoFvBl+ccxbKJ/AvqS6RclkU30yMb
	2MlD29dnNE6CSy++gkFqwW7mIii0hyk7p1DtTlgEnhG7ZYo2rn0SviLXxOd9ghZbnAoK2w
	kS2Rhe6TftZus+moGZEE2nsZFETMcg0=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-691-8bRsmo-mMZmZppN-2fTmuQ-1; Mon, 06 Apr 2026 22:31:10 -0400
X-MC-Unique: 8bRsmo-mMZmZppN-2fTmuQ-1
X-Mimecast-MFC-AGG-ID: 8bRsmo-mMZmZppN-2fTmuQ_1775529069
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82ce50e6e28so3184646b3a.2
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Apr 2026 19:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775529069; x=1776133869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+relXseHSDiLD/cBAI0rxB8yeQocHqRAcYJEZB5dGtk=;
        b=ZS1FUI2o3t4uj08yvHjHVvugjxTc9AuFVUP6a8diSr6Ptt8JoqWJsu+QoppKTPBRgW
         6GbkwYx2OH+limmPvpEi9SDZDLA1mXtogWDeyhI7aLf65bbEXKyCSV8ViPq4lJ0TG/tW
         EC+C/Pj/cB+KStF0M4iBIAY0MZzB3mhBJarDimjLYiboke9Aud3JnXNLedbz78e30xNr
         dU/tjMRKp0U8Km8Hqi34rsfFvokH6WL4TiE0wqN8yNRFTIhJC9gWSFGuBXCtuShxYdAh
         SqaMbbinRIHXE77zm4htoNdWXSJ0jNYcdC4X849hKySnSpn1gkENhpsuYcvk6QFFMU5T
         AZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775529069; x=1776133869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+relXseHSDiLD/cBAI0rxB8yeQocHqRAcYJEZB5dGtk=;
        b=DiZSQKrJ1DzTDXMgmb86k7+DyMf6ExfOHlcVIPgOPJxwlCmswvbKxBz1Ukdx8BmQmm
         Lka0dstbnZ4e9dMTiDf7FZ7gGANYh4qR1NnHjf2xIZO+kAbIF04plQnDtKavKDmHJ4AZ
         lW28S+UIwoMwMdBsw1wwRjGD2GZI3W3bxwNjULQN7xKi67z0W5u8py0H+r27TYDxYe80
         S46ztsEQp84/a2yJmOoGCP7uHXom/cZbu4oisS6G2JBnpHJx/WkW4pwycC8w9haeaYd0
         y91aITEn9BQBjgEiWGrcQfE7IhfcJHSUWIh03JgI+Q2HSHusRR6amzQ5550YNC7MxTnW
         sNfg==
X-Forwarded-Encrypted: i=1; AJvYcCXU/t/xv2lTBVM4jN5DAlsA4CwszUIKHGgR6NTmj4OR+BvYv8A/Eplvi9hnaLrGD3tvYJrm/roWeJwkEHU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPH03vp7dz/sCbXI+dlroZdkfsAT/aQbLighuiU/hPA+DbKdFu
	4Z8wtM1AGc446n/GKKrtZPy8WYdTNicMhp+veBrO8+sfliNVqD+cg1w9FVNeD00E4TtAKNDLrF6
	JOaiVDnebc613/0Ge5vt3KNZ0/8DvEFXgcm973G41rXOl6e38bu/nSwYX2X3M7G7kHw==
X-Gm-Gg: AeBDievBMSndhWeuC/jLM2qBdw7KkmCNOLLbLFCHNVN63O91nMMb8a0g8Q8cgx8AS8u
	M8LsE1vbnIWxPPPkI/q6J065Zye8OmUU3GRY86QxRb9IjAUNWo3tPXnQ6+CZdD044rdUXndE7Hw
	WgMl4Cf2kOd97kTf4TVRC/BIdMBfQ03TftjR2BNd1pvt0yyq+HthDTEj75QqHAGgzYnx37q0kjG
	kJWi5btMPmXjQr2yoZAJpnqIloabaITymv1xJquYHifPjlCSRqVaouGujtV7FV4/6WPc0pX+blO
	fpAg4GY/Za58mDifv2mhB3YuXk75l4xemcna1gew6Mr/9kgYT1VLFpnzXEyURAOp/Cj6idpFuRs
	vuQtVUmbr3eBq0DchEQ==
X-Received: by 2002:a05:6a00:3e19:b0:82c:d6d3:31a1 with SMTP id d2e1a72fcca58-82d0db4f938mr14513058b3a.29.1775529069372;
        Mon, 06 Apr 2026 19:31:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e19:b0:82c:d6d3:31a1 with SMTP id d2e1a72fcca58-82d0db4f938mr14513020b3a.29.1775529068879;
        Mon, 06 Apr 2026 19:31:08 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c72967sm15221583b3a.49.2026.04.06.19.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 19:31:08 -0700 (PDT)
Date: Tue, 7 Apr 2026 10:31:05 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, nsc@kernel.org, david@kernel.org,
	ljs@kernel.org, Liam.Howlett@oracle.com, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/2] selftests/mm: clean up build output and verbosity
Message-ID: <adRsadO77aF3WcWm@redhat.com>
References: <20260331094402.144131-1-liwang@redhat.com>
 <20260406193216.GA1319599@ax162>
 <20260406125133.eeb8efed993ae1faa2a9ad73@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406125133.eeb8efed993ae1faa2a9ad73@linux-foundation.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12702-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liwang@redhat.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B77A23A918F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 06, 2026 at 12:51:33PM -0700, Andrew Morton wrote:
> On Mon, 6 Apr 2026 12:32:16 -0700 Nathan Chancellor <nathan@kernel.org> wrote:
> 
> > > Second, the specific 32-bit and 64-bit compilation targets ignore the
> > > standard kbuild verbosity settings, always printing their full compiler
> > > commands even during a default quiet build.
> > > 
> > > Notes:
> > >   Andrew mentioned he hopes this patch merge into kbuild tree, so I resend
> > >   to linux-kbuild@vger.kernel.org.
> > 
> > Kbuild does not maintain anything in tools/, so this should go through
> > either the mm tree or the kselftests tree.
> 
> No probs.  Li, please send it along after -rc1?

Sure thing!

-- 
Regards,
Li Wang


