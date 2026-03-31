Return-Path: <linux-kbuild+bounces-12377-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHR3MDNXy2leGgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12377-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 07:10:11 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6403136402C
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 07:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 663163037D46
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2026 05:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D270922156C;
	Tue, 31 Mar 2026 05:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BkODOAMi";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="e5zfqKpp"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7E5368269
	for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2026 05:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933795; cv=none; b=ZiLlkXIqVKWXeiG+61bRuwnUc6d3SX9fHXirWhJWViU3VNzq7CeLMgW/BXYDnrxE4t2w1vtbKk5Ps0yWCU8sUJ48bdyVwS4lpNAo4LjmUTa1emeW9jWIcCgd2/wsUuQ3zjSTUKH+zsKCNLfbzIuKHs/g3JF/9zk+2h30ynYQElY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933795; c=relaxed/simple;
	bh=VqI0qmMA7x1ZQDTkGxD/iMgv7r7uMkbJZHvfiWsYZ2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i68rrZxgjy1B8thAqiPP+l7ugNhtxhKdY13l5ZflCe6tdwYSmoXFMCO8QCE3P/dQVq9x/BwMtoBTVym53GAtJiKR0PSBigYEUL/gLZg+20Yy6XV8gHdTeEHzed8gw25sQU2iXubY3rlcogjH5W0J79QWMFY3rGURx75Vm1zc8ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BkODOAMi; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=e5zfqKpp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774933793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FW3IFPPj9g7rG2hQNdFw4endj2uGmuszkMfYA6NeQeQ=;
	b=BkODOAMi4Q+arvCo+98MD/qlzJCIVbmoeDTiKZPo/4XgJ7UfMpxneY0i6Gvw7sS3p7xf+4
	KfaS1q5wZmbM/2lATOVNttEpfdH4PUXsO02GI13cHgM2FcQ48L6JZMDGQ37yvKbkKaQr4j
	Hc6DA/oXMgYzKq8JnvoZG81dpA4TAhk=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-523-0O3MvN8dNaOljGsN3yIR3g-1; Tue, 31 Mar 2026 01:09:51 -0400
X-MC-Unique: 0O3MvN8dNaOljGsN3yIR3g-1
X-Mimecast-MFC-AGG-ID: 0O3MvN8dNaOljGsN3yIR3g_1774933791
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c70d1f65aso3421615b3a.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Mar 2026 22:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774933790; x=1775538590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FW3IFPPj9g7rG2hQNdFw4endj2uGmuszkMfYA6NeQeQ=;
        b=e5zfqKppRfUQmBF4/UUmVCKfygpUMmSwwfnhkDJ007tTTrwj8kyi6TieLRC46yjpa2
         2jxXgpD+xSQWxXNDkkDtED1THSzNTAf6OABpuE8T4zMVzXgQKmIrF66Oa7rccJYNNJZg
         CXRJ8zpFoJXBvnPvy47nN5ik1gLzIvRlN2PWCVRJv5B0mDEXuscNFOhuubwVC7z52a/B
         VsK06cHssthS/b36+m/+jzOKCFsOiG6Sqc0QjZLGa18LnudatXqgOrAbJacSl3YgiuBF
         sGs0kk/gOMtnDFipyN0N38QlijFHaFR4P7Fs1/ibU4dEQpsPh4LThkiICyHuEuAChqNp
         87Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774933790; x=1775538590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FW3IFPPj9g7rG2hQNdFw4endj2uGmuszkMfYA6NeQeQ=;
        b=Dm+gnljysuVFp7EMRc1vcY/w1ZUzKB8Qik7zzBLpj3UFSVD6xna7u0KdyXX2kSzcOH
         uVmjdzyLQ1SiJNDTNSTXYP+RdKc2tz07DvnSw28aPQ4AIWqH3RqeV1HiVFQek25QczJ0
         B5DNGcbykbD+3RN0sjR19YW+TlR4qttbm7HQ9ZQ0SUP75s/UG/7SwaLcUXZXItAzfwDX
         PmtS4S0SkK+E78/XyM+oYds1IjMj3hjeERGVWmgfxY6xZZ0yVJotSsKLzh+FY3Jl2Cm1
         kOERB5EBhBfQD52WKEtHc/IbbkdNrhjyilscQxItfVcohVdtxojEvgOKIGJW0Rt/nxjV
         wssg==
X-Gm-Message-State: AOJu0Yw5snc+tCzMPX6lx+4Ax0V48GkDTS3r65epzIW3Pjt5XfzdJUWx
	5JXTpwFOUzaZaJpg1v8QAFmc4vFumB/2IkvP1ogfM+fWP5OcMEIApXsy0V4fenySJ5pXUBZ9HBT
	r4JJkzmntkm1xAnpNoPz+foizfn7gkSTga3fnZ9C+1ajCozu7/KVlZnbjqVmLyNHZwaszw7YtDg
	==
X-Gm-Gg: ATEYQzwKBqPzcOP8v13RbpCQyMR5jdr23UQeWrKtdrG9wXkQ7toU6EXBAECWShkLGmv
	OfYnpcTS7iJa2qKFBZegDFd5IonibxiCD1MA4AnyQLILX3vJu96ffEHyzt/cvXhf2huMkOE1qlm
	q/q3tP2DbVEU1NFNQr4nzL8bG0oe1SzPEJqqI/cikWnLk7hq35S1NpFwGHRdF3innQlJiQ8uNIQ
	Uuw+GwbWijG+HMa7lgSk+bpaJkNu3ql4kzBiegS7aLO1kP81QDBFXVSiZ68Jgj31bshpVcTYzy3
	T+M21qYRwAsypWpB759xZW2t3yP+390gbHEfJxpYe8w0stQJLbveNvZQBEx7VceUopSp8uGGfDz
	VfvTGKJvr+tfD+/A1XQ==
X-Received: by 2002:a05:6a00:10d5:b0:829:88e7:c88b with SMTP id d2e1a72fcca58-82c95e6983cmr14635712b3a.19.1774933790282;
        Mon, 30 Mar 2026 22:09:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:10d5:b0:829:88e7:c88b with SMTP id d2e1a72fcca58-82c95e6983cmr14635686b3a.19.1774933789804;
        Mon, 30 Mar 2026 22:09:49 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d019dsm10517195b3a.29.2026.03.30.22.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:09:49 -0700 (PDT)
Date: Tue, 31 Mar 2026 13:09:47 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-ID: <actXGynAOer5tCeu@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
 <acc49s7jbI9Q3a4f@redhat.com>
 <20260328135650.435b415f8c00835b2fa471e0@linux-foundation.org>
 <20260328140311.d6ce99302f93923b0cffb441@linux-foundation.org>
 <acj5RK3lze7o704Y@redhat.com>
 <20260330170954.47dfef29063afe9ea502505a@linux-foundation.org>
 <acso4-02tZhFBnKI@redhat.com>
 <20260330204941.de4ba3fde700e669d33f054c@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330204941.de4ba3fde700e669d33f054c@linux-foundation.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-12377-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 6403136402C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > I have created a patchset for those build tiny issues,
> > let me send out to you to have a early try?
> 
> Sure.

Patch posted to:
  https://lore.kernel.org/all/20260331040156.119158-1-liwang@redhat.com/


-- 
Regards,
Li Wang


