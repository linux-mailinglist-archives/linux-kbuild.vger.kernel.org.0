Return-Path: <linux-kbuild+bounces-12374-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDlfHg0py2n/EQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12374-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 03:53:17 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7E0363346
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 03:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C678303CE1C
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 01:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B66F30BF52;
	Tue, 31 Mar 2026 01:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="StiLg1x+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bw8Jei/2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D213E35C190
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 01:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774921964; cv=none; b=Y9ELNWcv1RfFDanm9rNMXF0ksQ35p5ctYVAAsIHSKRi8NHqWNrRwH50glD7BQRm2ZL5nXuizwAqIjNWNMAZNRuRAyWR/f/I4dvO0kL7UsynzkNz/y2tFMxjiL4pAoFhAvZ1pcjcFl0aAl0Z1CUaxK8Hu8rayw9p6/RuY6cJjizI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774921964; c=relaxed/simple;
	bh=95rFrOHvCv7v/K+6MKBLyHqB0RhvY533VlWoYA3J5DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KCUcux1kCSzQaM06rutSyJ340Utaodj8Leh0eWih3Nx8PkGQpHFCaQn4FUvgXVAwFWGOeftx6LcCiuEgKmhkbNjYcZtR5GPTSas1khmwrNBp0jXkELsJqzk5nKxWwWZbRE6nC9MunUZ/F0daM2hPKah/sqLJBMrZJUA7dCJO4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=StiLg1x+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bw8Jei/2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774921961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5qE5Yi1PlmOFr6JMHkA02+Lnj7FFZQyWGNZvCfi3+DU=;
	b=StiLg1x+Qcg/nRgWJWs7r3G21IT+/9fNpDxeWzPY/9lXmLap9wLTnaZ/bPvjGJrcR4JDNH
	Bu9YONCbIloB25G7dQ6GHsLU/j2owknOqfdgoPit2udYEOs/fyLHnIrA/8F8WuD+xab3fX
	OfaxeGGgRTABPTvQlPy52RXNAuBXAeU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-BiNO2BBKMZimd6VnA2ZG8A-1; Mon, 30 Mar 2026 21:52:40 -0400
X-MC-Unique: BiNO2BBKMZimd6VnA2ZG8A-1
X-Mimecast-MFC-AGG-ID: BiNO2BBKMZimd6VnA2ZG8A_1774921959
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2497cc190so17227025ad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 18:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774921959; x=1775526759; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qE5Yi1PlmOFr6JMHkA02+Lnj7FFZQyWGNZvCfi3+DU=;
        b=bw8Jei/2aDiVHY7mCzcVehd1A3hfiw07IkMi2aCp3R65VVeCgxRvUQ8Sg0cLAvflBY
         TcvVTSyk8/9bO7Ms0IccJzqV3GdAsava68C82p0IEz3pXDDsxYw2urOSjyTbDZkZ6Wfp
         p/R6Kb9nXU8lwPMzmishYFc25RhUjvixuu4+qeLMGu3guiuWyf1APZqAHBDcQ+G5CoQv
         7krmZ1xaSl5YeIhN5rIfzmEQAb9OaGO7yRkv7/wCJooFemyhJrFmSPpqNKEc3iz1WRE+
         b9waE4/wQNVxKzHkqUK77f12UrVDgQO5bIzQMgh+7VDs14vK4oJI/veLXWMTUi4AKRwh
         gjRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774921959; x=1775526759;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qE5Yi1PlmOFr6JMHkA02+Lnj7FFZQyWGNZvCfi3+DU=;
        b=FpI3WckHsKr3Yp7UPU1gcn/QmKTtII9DXPGklYtyPTHf9fgiEFzZbDLKahNXmwAFol
         mstmdVbwM7u9c8pqGebygOpe6cOzbLWZJ7qS0HFUYm4/i6XHQ8vKIafbkCpmIBKQ/DdN
         tNVN6bawGXZHs803wmw0DQ3pHbJTBamH4frjCIApD5sSv6z39yF+1UQLuatZaeGU4vTX
         UnPyUxw4mGwD71VMzGWIWOeRpgnHR2f8KZbZ5aK9V2xqZBI0a7SYL9R3WXeFvuwlhRZY
         sv7M5OqiyBYNVqCkXsgI2Nro59uIMAl25yrz1jgNSGhfa0nGPRvDYRWBc5Vpi6ULeBmS
         JQNQ==
X-Gm-Message-State: AOJu0YydzVYMYJNbvfuAjqn2Z3nugyxpKmIXc4czgayQMS0Va5W1gDw9
	yi0Tb4IWxM+JM3NNA7OTyc1xlgMZx/ZII7tvNEwQKP3jgKCgkJhX3t2K+A7N1vg/pT1IPEugG1o
	6npb9ExPtDSP4n2d2rmsE1HNAID1JRImq9XSRtyfdUiHk3dw90/tayltC4M/IBwvfAA==
X-Gm-Gg: ATEYQzwaA+q/T+blE1kdgLhU215bspE6MrwKJTyOtIIBkwBkXD9zAemO8tEuosCVPZ+
	fbwNgruGuoo5LCq1JeM0C3ZpD3L8vX/y+PcppbX0n0Mpmwqpxf3qOOfh/+gBu1Wk4wmD6VD6IiR
	fUwwijMtDIF+SnnZnBJYSam3Ra0mFCKsJOZzk7jVN9in/dudQO0+/7BAweI6rerZ6QBZFr3w5Bs
	Z9HD6c2ks7kzfTNuxuMUVep0QJtKXkXXjgqYQVjIZrHGABlpy1W8fJ2y8sJjUU6JIIjIOaRACar
	0Jn1Lgbs5PUEoaCSCLbDdPqBSNhxjYK8ljnWtkDi0X+F6MKpR7ZGslhLo15Nmm1urDhuMUrf5bV
	nTwh1WWYfQGhvGnbsNA==
X-Received: by 2002:a17:902:da8f:b0:2b0:51be:f9d7 with SMTP id d9443c01a7336-2b25ef347c4mr15587645ad.18.1774921958946;
        Mon, 30 Mar 2026 18:52:38 -0700 (PDT)
X-Received: by 2002:a17:902:da8f:b0:2b0:51be:f9d7 with SMTP id d9443c01a7336-2b25ef347c4mr15587375ad.18.1774921958436;
        Mon, 30 Mar 2026 18:52:38 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b3a82f8sm64351325ad.63.2026.03.30.18.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 18:52:37 -0700 (PDT)
Date: Tue, 31 Mar 2026 09:52:35 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-ID: <acso4-02tZhFBnKI@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
 <acc49s7jbI9Q3a4f@redhat.com>
 <20260328135650.435b415f8c00835b2fa471e0@linux-foundation.org>
 <20260328140311.d6ce99302f93923b0cffb441@linux-foundation.org>
 <acj5RK3lze7o704Y@redhat.com>
 <20260330170954.47dfef29063afe9ea502505a@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330170954.47dfef29063afe9ea502505a@linux-foundation.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-12374-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: ED7E0363346
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 05:09:54PM -0700, Andrew Morton wrote:
> On Sun, 29 Mar 2026 18:04:52 +0800 Li Wang <liwang@redhat.com> wrote:
> 
> > > ts:/usr/src/25> cat Makefile
> > > # Automatically generated by /usr/src/25/Makefile: don't edit
> > > export KBUILD_OUTPUT = .
> > > export KBUILD_EXTMOD = /usr/src/25
> > > export KBUILD_EXTMOD_OUTPUT = /usr/src/25
> > > include /usr/src/25/Makefile
> > > 
> > > I've done this twice in succession now.  Any suggestions where I should
> > > look?
> > 
> > When build selftests from the top-level, sub-makes entered via `-C` may
> > still inherit the caller's PWD from the environment.
> > 
> > Some selftests use $(PWD) in recursive kbuild invocations, which can
> > then incorrectly resolve to the kernel top directory instead of the
> > current test directory.
> > 
> > Maybe try export PWD in the ../selftests/lib.mk?
> > 
> >   export PWD := $(CURDIR)
> 
> Thanks, I'll get onto this stuff soon.
 
I have created a patchset for those build tiny issues,
let me send out to you to have a early try?

> Meanwhile, shouldn't this work?
> 
> ts:/usr/src/25/tools/testing/selftests/mm> make merge.i
> make: *** No rule to make target 'merge.i'.  Stop.

That's probably because Makefile explicitly disables the implicit .c to .i rule.

In line#43 of Makefile:

    MAKEFLAGS += --no-builtin-rules

I doubt do we really need to add back the 'gcc -E' approach? 
The selftests build system intentionally kills built-in rules to prevent
half-broken implicit builds.
(the comment line# 33~42 in the Makefile explains why)

-- 
Regards,
Li Wang


