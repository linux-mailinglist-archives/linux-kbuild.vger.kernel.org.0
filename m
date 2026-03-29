Return-Path: <linux-kbuild+bounces-12334-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Y1PtCVL5yGnfswUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12334-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 12:05:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AB435182F
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 12:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D8C753009FBF
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 10:05:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E20EA2DF138;
	Sun, 29 Mar 2026 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NFZeGaGq";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="qQtcEWsW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F863C07A
	for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 10:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774778701; cv=none; b=J9Ya9TZEHQy6h+IeNbkfcERtJCgy0wXH98wWkBglYPSjijoRWrayPpgfhO/9J6zjS9phD1rcKjMcV9low0o/jYnYIekPi6qf0cys0PC5QTqVwPcbUyiXCalULn4t/tA/+Zc9aY3/jCr2PCgL0mg8w2zEoZNnxoXp69+XCTUvc2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774778701; c=relaxed/simple;
	bh=gvGHC1vYZBsOAAWNUlWuTZOWh+DVU+X7VvCKIF8RYmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tO7q6TL2bJMo/jjscLiaehZwWQ8anuBujJCX2GYYKxqoiGpE/tCwzlwin0is0Dk0tbBJEBZTQqCM/ez+MFx1g+9CBja0PUum0A64PIdkvMDmhvBZ2FEWCNGN686G0RUx0mhEG726iEi7GJTiKFCliDOi02T0cw3bvP1N/0RSEOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NFZeGaGq; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=qQtcEWsW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774778698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=StPdatf65Kzl6nkGkBez3hMmnmGSSlFsSD2/9R1+ZUc=;
	b=NFZeGaGqER1FxXvI85YhiKhSpaUKoMWV/kTJoFDLbJkhjKi5/rTC9dpW2gl6gwfOUR7L4G
	ROlxBzwwe7/DRYYmN5/lMwsIwqJEkapnQlHujLrOdwiQpGW8kxRBF5OfczM09Ckwtuh4b9
	ppNIyxFZx8rIVIpw4Nkz+JROuAmiHOA=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-bY2TgIj6OC6wnyhqwm9wDQ-1; Sun, 29 Mar 2026 06:04:57 -0400
X-MC-Unique: bY2TgIj6OC6wnyhqwm9wDQ-1
X-Mimecast-MFC-AGG-ID: bY2TgIj6OC6wnyhqwm9wDQ_1774778696
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0c92ff4ebso32154285ad.2
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 03:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774778696; x=1775383496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=StPdatf65Kzl6nkGkBez3hMmnmGSSlFsSD2/9R1+ZUc=;
        b=qQtcEWsW3CfhblaNrJCYRI3oR/tmg5Lhk6LwPO+/igBnQKje6jgos14qeQ1guF82gj
         dfOWQs6xI/ZgghGfBOD1LWL745V8GcAFISZrlrrCn2dWN8jI5vZfoGmBXFDVEfSPOEd7
         SVGbokeo11K0AnY1fExMBswz26XovKMeY0NVKuFf7N3WfwfDSeA1L0pHpHcLOyqPYvg3
         vaxOinskOB/+dnf2JT/Bu4wOtwQNp+PDjIpr3Qxmuk7PcbSIOCmrrOFvP0q1zyJgdE+J
         Z6WE7iymFrE5rRrs7Oo36eDMQA6lGNdzfUOYJ1iV/QgO/u2n+Ij8cWMVNjKWDUvl00X5
         in8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774778696; x=1775383496;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StPdatf65Kzl6nkGkBez3hMmnmGSSlFsSD2/9R1+ZUc=;
        b=qYH0Zoc+9WQUakNHGIWndoVcv8G13RsH1tHg799MZTWEFkPu2agWwOgGO2kPtvqExF
         QA7lKZrYJRo8k8BuzWwmOlf1pdsV64reoKhbzsa150V2RThKlxyWZGzWuUji/AfcDmkM
         lnn7miqGKbx77uJN4/gwV69eB27ODszXepEqsHv2Q7mdN/69JTAkHi4omF4ArjuDizNB
         6NOcw4b/X83NxL6Fga858eCG3umQAdVybvycmHUMJ35XkXqufxOTSIEn7SuU2AQfQdtY
         EyRxGbmnZE8vJoq925lcXuYIFcLlJzxKEa+bwIJqs6DnGp5ecVRHT7IWXWZef4xwYLGa
         JwBw==
X-Gm-Message-State: AOJu0YwFrtd3O7VUDQI7JUJYAa5GP2w19p396Gote6cukb++DVo/bFKM
	C+Ei4RvsibI7bPrIDDXdxlYFunU8R0Or2m19GUBWNg3Zwhi3mXFwkBgGWzE5ZTb+M267A+rKD6z
	X2AbJ6gj6+02vF7hoACbRKJCkt46ggOc9hp1SkMCwzFzN2GRBNm5x+w0Z6T7UjBHyJQ==
X-Gm-Gg: ATEYQzy54LixnpEpRlKu11oqjWr77RCwkdFIP0ZDuMt+fR8FLy8oSsjegrc3AJLATr2
	gwyaPuoB2Spn/tcElM3Rr04MLKJxsdCm4bUm+Sc3SJDNE4OABSqRl1oBbfwY6kZ3gpB007jJwdR
	TtFtUIm+WBJGLSo9DCdWeQSC23pVHlAxua/2Ksmkh0Cn/ksbnx7NgGntzHTCGtosQmICB4kpkvz
	4Yoi/DBzz7CCGWUgXIdoB6UhjJLegxgkgxu4bHZTRcbiPIq2mdHPquiuA156Mlb17iZBg/WunU/
	vL41I3Pthm6XWF5gpah79NIbhO7qiWg5kJVK3AhHiVoRqddd8QPlc9hzbal8KGbxzI06bgFog7U
	NBqo8KSKzA3RxA/ly2w==
X-Received: by 2002:a17:902:e885:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2b0cdc9b555mr90550945ad.13.1774778695932;
        Sun, 29 Mar 2026 03:04:55 -0700 (PDT)
X-Received: by 2002:a17:902:e885:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2b0cdc9b555mr90550785ad.13.1774778695455;
        Sun, 29 Mar 2026 03:04:55 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242766219sm44817195ad.53.2026.03.29.03.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:04:54 -0700 (PDT)
Date: Sun, 29 Mar 2026 18:04:52 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-ID: <acj5RK3lze7o704Y@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
 <acc49s7jbI9Q3a4f@redhat.com>
 <20260328135650.435b415f8c00835b2fa471e0@linux-foundation.org>
 <20260328140311.d6ce99302f93923b0cffb441@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328140311.d6ce99302f93923b0cffb441@linux-foundation.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-12334-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liwang@redhat.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 65AB435182F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 02:03:11PM -0700, Andrew Morton wrote:
> On Sat, 28 Mar 2026 13:56:50 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> 
> > On Sat, 28 Mar 2026 10:12:06 +0800 Li Wang <liwang@redhat.com> wrote:
> > 
> > > > from the top level?
> > > 
> > > Should use:
> > > 
> > >     make kselftest
> > 
> 
> I'm probably doing something wrong, but `make -j50 kselftest-all'
> appears to have scribbled on my top-level Makefile, so now I'm getting
> 
> ts:/usr/src/25> make kselftest-all 
> /usr/src/25/Makefile:5: *** Too many open files.  Stop.
> 
> ts:/usr/src/25> cat Makefile
> # Automatically generated by /usr/src/25/Makefile: don't edit
> export KBUILD_OUTPUT = .
> export KBUILD_EXTMOD = /usr/src/25
> export KBUILD_EXTMOD_OUTPUT = /usr/src/25
> include /usr/src/25/Makefile
> 
> I've done this twice in succession now.  Any suggestions where I should
> look?

When build selftests from the top-level, sub-makes entered via `-C` may
still inherit the caller's PWD from the environment.

Some selftests use $(PWD) in recursive kbuild invocations, which can
then incorrectly resolve to the kernel top directory instead of the
current test directory.

Maybe try export PWD in the ../selftests/lib.mk?

  export PWD := $(CURDIR)

-- 
Regards,
Li Wang


