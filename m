Return-Path: <linux-kbuild+bounces-12384-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLTUCn6Zy2mYJQYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12384-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 11:53:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0FA36762D
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 11:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 27DFA3098CCD
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 09:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A123D890A;
	Tue, 31 Mar 2026 09:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="P5+/6GuW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="GLcuRK8H"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E543ED5B7
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774950657; cv=none; b=mdazZWIPfE4wnsD5FkAh1YEfSCjO0/wMA/cA3kG84T721NxM5+Kuo/1IZnJL6lfR/7KFM4/JU11s+xiTgfTWd+6Ix1TQ55KxSCoe+HjSbNxZ09aOYulz5VUaSScW6YWPME+J+2Z621jc0RoYLkUiPxiRHuudCEJW/ygLX9b3Snk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774950657; c=relaxed/simple;
	bh=HLRRb/A1VPkCgMepDwjYd0fDVGpLpik1suWmqwA5r+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gRQ0F1iBSATqNyEJ0r7HgzuOMlseOo8wK8gkfXVyvGy9lxXE28uuD21JS0rQa2cIjGmvPNdYBRpWlPw42VSiq1ouv9xyOgPY2nM40iTlC66PrOkVM+Tu6di4vKQM3ukmrm/9dgeT3tw/bWUppWHmvclSmHa37oNoZy2h8TJJQCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=P5+/6GuW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=GLcuRK8H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774950655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6ZUnMNCPUch+nJ3/cZQxbUv/pjvJWtkozyvEHDR71gc=;
	b=P5+/6GuWEIyUsKZKusBPkjdHzNKiPK6suWyRZatYnX1Cn6lHEKymXHmSl5WmSDr5lciUXk
	KCBH3/OIlC+HcXPanB3cf0zfBrU/My2OEHdcn12zfdE23NMCPDyISXcL5HaA0023HbkFlD
	nwHrm5X+onlVm/SnauItO4lqGCo/veU=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-xccf-skWNYas1H6HWfYO1Q-1; Tue, 31 Mar 2026 05:50:53 -0400
X-MC-Unique: xccf-skWNYas1H6HWfYO1Q-1
X-Mimecast-MFC-AGG-ID: xccf-skWNYas1H6HWfYO1Q_1774950653
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0cf396c45so50739055ad.1
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 02:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774950652; x=1775555452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ZUnMNCPUch+nJ3/cZQxbUv/pjvJWtkozyvEHDR71gc=;
        b=GLcuRK8HaHr7SIpLXhnb/zMaKaSHIz5ztNAIn95omKTPryO3XifumFBiUzzdoxl4VY
         ef4Yl8EojTtiGt7mJl+zVpKUwwQESE0hCCy3eOO2S8fSAkY8GfzPFY4oDRBC/GgyrQIV
         iI/HvCavYoy/ayVrX29r7bKZ+RDFbg6N0gj0c875Pz/hnxWe5pwbDKPrZqVSHCgOy0kV
         9sITjVH2GFQFHBWI+D5rQ8oEuqL00viQrZtM9PxWvKCKUJUHP4ghJAtXFhqVCxjPQtt7
         eSScNV7MTPD2t6PKHocjDnIec+ODmAxWchQS4xmFd13V2OouWl6a3pufiuf1tknZIID7
         31dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774950652; x=1775555452;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZUnMNCPUch+nJ3/cZQxbUv/pjvJWtkozyvEHDR71gc=;
        b=Lt0y77f+Dut6PbpNbrXbhereIe84v7fVQAxVOLlP7XDRMLiT3cewo5UfjEQ9tj3dfu
         2pkfoT13mGMxrbqXWKm6oV2MZ/rppybXrxfauYXWlglSvfgUo7bn4J1zSXd77ctC+8+9
         OGQzcO2PsObmROwm7F5xzpcDsumehvYmTMZw479NjFNJRWwFOlqhWcQ7SovpNozdtZVQ
         sfWGXjxo3GPAS0iKZoVYmjsTG7+ZfdsSThBk0QmxIiz7Pa2W7AcGKwrD2a/mkIsnVtmT
         ODl+jWb4+F4/EYqDECSxjIFdgqADQKqNH8ThUTqsj6G0naafzxFwuWRs81mVmhrjGDcB
         0ssw==
X-Forwarded-Encrypted: i=1; AJvYcCW1WaFWm20OkjFjjkOdseWCId2CpsBiEyjyx41+dlfUvvK4UT2tU0FQzX56R2rRM94xFakqB+taYSdDBU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuqJscFY7qTiQaTj9RQAPy4s7piv2f5aTA0PiwUJGJEq/f81Yp
	yG6osR/An3Ul9LKe6pXr43M76Y32gGBkl8/C3WGvbMylSZwGzeqXjHvA0ra/lf+8ue8IIT82ruh
	e0l5zC9yCUspXL3uK66GDMk/F5sfD6k5yD0CIbotNSRKjQ717CEgXQQfx2L31nRfm7g==
X-Gm-Gg: ATEYQzy+JvYqlzip4XNNztyXU+52HqaJNvmOmjD9b6te7GCl5FmfWq0V44u0GH5Tdij
	IjELnJ1hBbEeOdum2O5Tq3ecMyMIcNctDLLQPUaYYguvJ4ftD4I/02KRyv7PUiQtHP0LFIpy27O
	/QbwRGiCDsNqzhocLtWBhg+vuTQlC/JaoQnqsy6cwEqD5NttCh0ry9NoY1GN8lnYiPve4WWq4Sw
	dpVYzXHVCbZjy3cpXW+p8F88ZJEFr8ybLgMNKGrdXt4NcnbuBB3m+G9rhQQA53CkBwY8pKOCLke
	qLvAIfKe/IQ/EdV1SpdVr71cQwzyEHVSnhoo2ZL4j/CHOxEbApvJPAj9Z5ZTY1dWaHfWImgdcg8
	Of9AOQiJ2jTvsiK7hLA==
X-Received: by 2002:a17:903:32cb:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2b257f39949mr54097915ad.7.1774950652623;
        Tue, 31 Mar 2026 02:50:52 -0700 (PDT)
X-Received: by 2002:a17:903:32cb:b0:2b2:57f3:8d07 with SMTP id d9443c01a7336-2b257f39949mr54097695ad.7.1774950652197;
        Tue, 31 Mar 2026 02:50:52 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24277fb50sm103515325ad.56.2026.03.31.02.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:50:51 -0700 (PDT)
Date: Tue, 31 Mar 2026 17:50:49 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: david@kernel.org, ljs@kernel.org, Liam.Howlett@oracle.com,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 1/4] selftests/mm: respect build verbosity settings for
 32/64-bit targets
Message-ID: <acuY-biDCExbw3aR@redhat.com>
References: <20260331040156.119158-1-liwang@redhat.com>
 <20260330222932.a8c10bb3ea3e86581fcea8a0@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330222932.a8c10bb3ea3e86581fcea8a0@linux-foundation.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12384-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-foundation.org:email]
X-Rspamd-Queue-Id: 8D0FA36762D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > Reported-by: Andrew Morton <akpm@linux-foundation.org>
> 
> wow, thanks, do you want my credit card number?

Only if you want me to add a Funded-by: tag to the commit message. :)

> Tested-by: Andrew Morton <akpm@linux-foundation.org>

Thank you for testing!

-- 
Regards,
Li Wang


