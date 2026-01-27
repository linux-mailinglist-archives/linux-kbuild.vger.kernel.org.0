Return-Path: <linux-kbuild+bounces-10892-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KCOsDTWSeGmxrAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-10892-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 11:23:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F83892B98
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 11:23:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0636B3017247
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Jan 2026 10:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37156335547;
	Tue, 27 Jan 2026 10:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0CBOsHD/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEAC233A9EC
	for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 10:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769509086; cv=pass; b=sH3kH7bLl7m4K0VB20mpKIil1DXNkAMXc3jazl9Adr8J30mW0pjv1LKsVwoLuEt8TPQVrxRnw9sEiDdVjJVlc6YRn3qijvYcNudl7dgjWCWKDOEtzF1Et1kvS4njhp2NsVdhCxVkLNVqTdrDX0+Cc3sSfolrNPfMF+VaaefAjpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769509086; c=relaxed/simple;
	bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pd5nFUAJRenqar/ud6RIjUz/S2HeYkQ2M+49jEtTiFLTx94VshZoZYTMzZmHNWaBAMuKDnTqGsImYtGN3BYlyFR/lysV4Imfil42ZfCQD+PM1WbHyaLkamzcKqQt57wEVasiajlHdw4PRKx0h6WZzmvTl6zK87SvvjmmPoA0uWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0CBOsHD/; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-12332910300so2129446c88.0
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Jan 2026 02:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769509082; cv=none;
        d=google.com; s=arc-20240605;
        b=EczPseNgGGJfkiiud2bBNpgeZppXixkb4Z7VinwhrN4iIviR15IpYKC9ZcDCrxVkrX
         Y1yjdrpxDB/mwDevYJD4OGButIvuNI4V033DVhKFqgFvkpD8PdCxXp1yOZJTiYsuqVHN
         pboqMXgIXEnrm0R/gmi10Sx6KyEZpSY5ixIyrMBV6Xeepvfh5uIEGTvQNvyWTvpf+umn
         Y1JPBDj704joJIYQvyJGJNtOxTgYu9t7jhGQd97QfoZMuMeBFw/zYGE6N1S5tFZypwIt
         AtChV/WG7DmTDLwyTg8pHSZcYKNpx/5OQXVn6B8d/sPsMUtlKnfsbStjteJsJkXI5U6t
         4VmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
        fh=Eo34V1bFl7vGQkpQjpP+DvdMTZxrjDaEFuXR5P6KleQ=;
        b=iZ08a4rEetBXmHufcuDjpt3pN1TSwoMJWTrwuupLxc+jwYv+6xx0+hjrJpfYEM7uif
         kZl7DGq4rXbaLRZlVhO19q6myfBoCpE7UJpr1jgJZNaCy3gdv67u4e04WBnNqXWkNcX2
         7SOtodtvUQcqO8NpWq86Wrqa20xSm7udxdVjtcy9fqXqi/V3wBW0+87GEcQvqmhfVL8u
         ZQ6LY3iSQYoZ8k4ATF31KNYSpie6fW3m7yCzNdjXGBani2YC2WW61jJGhg/YR0gwn7c4
         zP676VInWkk/erC6Zz9QEI+OdxltJ1yfNJfj5A6TiXLjEji1nsZON647X9fXwv6VkT78
         LGkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769509082; x=1770113882; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
        b=0CBOsHD/uKOv95aR8OTAbtRyWBxyLJ6N1fESKzC2veqVx9JPRAR/Gsg+n8VRUW2Hp3
         EG6v3t7dFFHmx4Qe9/enHqvAYc/MN+zbW34Q0dIEP/dBnHyBwmTXLN/s4AgkzfrYowyK
         TS9/3JGwU153BB0kkOIvZ5Xtjd+Bp8Z4TnxiAJfhMEvuCB4na3T6n77gyhHa/UDpEb0b
         IgALtOGmCw2o5+TNyDxryyFP5U2h1On49wPhmsdnKC83ra3MXi1Xx96djhullUZFhEEf
         Bu8bIyKcXqPDpnJ079sq0S/S0xkr66rrSYp7sxWe3EDfxUs2fpKiC1ykKYevzeLX0nO4
         YmJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509082; x=1770113882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9eWZA1QTRdZDTddGYL8SlE552QBQW/sLGGoi37wJCfo=;
        b=QERAExV2Q8DK6b6v5INS9j6+EUQ4zDCIWwZ56/7iTsx4TdjiOvIKAyAmOVLM20C5Ew
         fbHgcz2leqtsfnX4V0Kco0pv/LKT0ptf/ut2y7FLCzyu++uUFGwwV315z+Y0uJNhYVDu
         6Xq3cqm3DPJTyOZ/4QiU7qosrB+0Ytb2yFO/ofXT25EwWbA5vl8odBT75bVX7dTrEUfo
         AcdXzwivkrg4KSJr1xHy/cBhvz4VhQc3u0NORU44aWG9+5aHZAU/PqMAGjI/mrTe9+mF
         zwQZ7ls8VWWLcJpQqWJYiQ8RjAtiIGpnqGaaezWPOe712hkhMOioTAhP3i4Fg5Fe0hwy
         uw/g==
X-Forwarded-Encrypted: i=1; AJvYcCVzZwybwGG7Zh/m83bNESswXTPDVPiZdE6kAb+rCq80VPHSfmDBRDaqLW9FUjab/WQKMhRbpdFL27ys1Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgzsPWrxPuolA1mLDe5jZFrHgu4ZHrxtL6NijgEY1lmjbXaice
	E7uxrSuiXw+9Ui1r7aC9o/jPfaHOm55qgnRYcAC87UCRRBZgrroudlV+iPA+t+QaTI19VZkQyRS
	OZYbYhpY+WdrhBb4ibDS5uwwnDL4vapJ+rUg719Z4
X-Gm-Gg: AZuq6aJccAfV2fH22TSFlGOLU0BdEUPhSdABOyQxFv9khnJ4vF4ZZPaIy9j3c3Jf13v
	/19pyWt16kDnuiU6ME7HjXUoLiQt0JVciJOC8S+1zk+0kM58sYIBs8ynj29VK5sJAf/dVI8nnYz
	L0+ys9l558u8af9eLRZNd/N6C6pQ3J7G6rCyYVdyw8d19R+T5iJnpbECxZB4GEnJZCnVXaj5SCy
	mzMYJ8hMyoWmfZfdZa3M9YADRmhfm2vnxBshIJHzRbPMNQtdLwa39wRb/TjzFDojGvUu2vVtGEB
	iZg5SojgCBa5uDMa9A5eKRZRYQ==
X-Received: by 2002:a05:7022:6985:b0:11e:f6ef:4988 with SMTP id
 a92af1059eb24-124a00cd55dmr806676c88.36.1769509081547; Tue, 27 Jan 2026
 02:18:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219154418.3592607-1-elver@google.com> <20251219154418.3592607-7-elver@google.com>
 <0c2d9b69-c052-4075-8a4b-023d277b8509@lucifer.local>
In-Reply-To: <0c2d9b69-c052-4075-8a4b-023d277b8509@lucifer.local>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 11:17:24 +0100
X-Gm-Features: AZwV_Qj2UVNnjgQTvKRMxq0N2rMz8K4yMXQyPWTkZbJrWul7iRYbem2vd2u4cZs
Message-ID: <CANpmjNNHmOzaCSc9hQJNuzNVHXA=LRgXB4Q69FNk6wBuuJGdAg@mail.gmail.com>
Subject: Re: [PATCH v5 06/36] cleanup: Basic compatibility with context analysis
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Will Deacon <will@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Chris Li <sparse@chrisli.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Alexander Potapenko <glider@google.com>, Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>, 
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>, Eric Dumazet <edumazet@google.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Ian Rogers <irogers@google.com>, 
	Jann Horn <jannh@google.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Johannes Berg <johannes.berg@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Triplett <josh@joshtriplett.org>, Justin Stitt <justinstitt@google.com>, 
	Kees Cook <kees@kernel.org>, Kentaro Takeda <takedakn@nttdata.co.jp>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>, Thomas Gleixner <tglx@linutronix.de>, 
	Thomas Graf <tgraf@suug.ch>, Uladzislau Rezki <urezki@gmail.com>, Waiman Long <longman@redhat.com>, 
	kasan-dev@googlegroups.com, linux-crypto@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, linux-sparse@vger.kernel.org, 
	linux-wireless@vger.kernel.org, llvm@lists.linux.dev, rcu@vger.kernel.org, 
	Sidhartha Kumar <sidhartha.kumar@oracle.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,kernel.org,davemloft.net,chrisli.org,google.com,arndb.de,acm.org,lst.de,linuxfoundation.org,gondor.apana.org.au,nvidia.com,intel.com,lwn.net,joshtriplett.org,nttdata.co.jp,arm.com,efficios.com,goodmis.org,i-love.sakura.ne.jp,linutronix.de,suug.ch,redhat.com,googlegroups.com,vger.kernel.org,kvack.org,lists.linux.dev,oracle.com];
	TAGGED_FROM(0.00)[bounces-10892-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elver@google.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[google.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 9F83892B98
X-Rspamd-Action: no action

On Tue, 27 Jan 2026 at 11:14, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
>
> +cc Sid for awareness
>
> Hi,
>
> This patch breaks the radix tree and VMA userland tests. The next bots didn't
> catch it but it seems now they're building the userland VMA tests
> (e.g. https://lore.kernel.all/202601271308.b8d3fcb6-lkp@intel.com/) but maybe
> not caught up to the issue this one caused (fails build in tools/testing/vma and
> tools/testing/radix-tree).
>
> Anyway it's a really easy fix, just need to stub out __no_context_analysis in
> the tools/include copy of compiler_types.h, fix-patch provided below.
>
> To avoid bisection hazard it'd be nice if it could be folded into this series
> before this patch, but if we're too late in the cycle for that I can submit a
> fix separately.

Thanks, I saw. I have a more complete fix I'm about to send.

