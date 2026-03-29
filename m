Return-Path: <linux-kbuild+bounces-12333-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NoRKSbxyGlEsgUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12333-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 11:30:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA1C3515F3
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 11:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0585C300695B
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Mar 2026 09:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 321642E7F3A;
	Sun, 29 Mar 2026 09:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NBGfVh9o";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QYtFRxwl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F70218821
	for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 09:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774776570; cv=none; b=pp1lTOADwAwedtvgb31+2kcQe3e6UIn7pCrVTbkwXiezc+dORNPZ6TeTk7gbtpkqBZ7Klzt2VBK8sJKmeoT2LqKdtNISDnNzJK6fGAv2v65XffR44u8bOb+udIgut+JlZJvQjyaWH/ivxlQeMdXoOdqkPLnk9vqh/+PVcdyA1VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774776570; c=relaxed/simple;
	bh=IUqBfh3kiiNzJ1Gj/LBXuhisIBbQ9zTjjW5Tk1XT5zc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eUHukEv9gfDIIhfzP2Z+GuIbqVf/w75eFGXZn/Ospm9bpKgv+beWqJ0aQ0bgzRVej6WRgHw5D+3FsklkC4l7w1Ont3UylzPXktN3o6smwVTOu7U3GKSBnSADhHsuZXAhvKz872KzqtJnfPX9UhtEs+b+N6QiuBzsYxFL3MBLpis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NBGfVh9o; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QYtFRxwl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774776567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GMdypUfl/C9CntHYXbdkJ1JwbkesNU0zPkvlKNLNROc=;
	b=NBGfVh9oeoyw3pGKGQ1GP+sVW84VZNcDbARGsycVRWZNQGkZ9XXS2Gs0Dz152A63nr2J+E
	2Pzw2nXcbJmOYqcVebUwGfPyMLQZou9zn2PBQhhLImFYfFuTSaocS7yqmN7SPZOlwPkaMH
	ZeDczBYJnE4SD8vI5zlVNzDwWj9c7ZA=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-9-638xm0VNN2ir3PW3ng-tyA-1; Sun, 29 Mar 2026 05:29:26 -0400
X-MC-Unique: 638xm0VNN2ir3PW3ng-tyA-1
X-Mimecast-MFC-AGG-ID: 638xm0VNN2ir3PW3ng-tyA_1774776565
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82c245a88a5so2441339b3a.1
        for <linux-kbuild@vger.kernel.org>; Sun, 29 Mar 2026 02:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774776564; x=1775381364; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GMdypUfl/C9CntHYXbdkJ1JwbkesNU0zPkvlKNLNROc=;
        b=QYtFRxwlGOQ4xrcgTXAzLJPQiHa45Q7+5s3bCBcoZ/6AapeYNfGUD1q1RtCbps6X0D
         Vj9zGlMEatN8SwEqWzgpGFg8H73s3/Q6cuGJrlYtyi1M/h5Q81pMoZzp+gSyi8iz1bM6
         FO5Q+vT0vKy6AwwwmRLD3Xkyr4wDab4lPqil3LdaP63qCK/VQm7wF36s190vL0LN/Qtj
         zX7qEldOFO/j3P3ef6OturMbValMIzYVG8zkkU3te2dcjS6z3uXsLHyd9IzvT268JRDW
         yHm8AYE79A5Z3ECkVyzm+UTg1UwoXdQyJc4wMeXGJCgr5krqNu9DMTl7IgaJB055MM3E
         Md4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774776564; x=1775381364;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMdypUfl/C9CntHYXbdkJ1JwbkesNU0zPkvlKNLNROc=;
        b=gbLnn5g2mQq180ZOlhmGUnZ+OKqZ98w13T47Q+OuyVg6X+IBF9DAuAmLFMg0EdbyPD
         mw6HSbtKBXEnPbkrMT8Gs1L3fhYS8dOA1DHu5Yq4iggUgvgZU6jge4xD328xB1jUCrzK
         pUgFUJA/muCAwTFz9KDuDiKEN9WLj64KEnjzxmO+ur1Ott/wKM03kIdcuW0VLMC4RM66
         uxgS+E6hkuLV3i8/eZUP9B8rysFABMmmQZgxCYdZ5d0nDMkp6xnXyXcMJOmm+2cmPabz
         OMZQy46CwB4AyOwzZXMBFtV0D2c63C48AVRGtAm10JvJaDSXkHsB2Os56FLg+ybr3RaW
         PISQ==
X-Gm-Message-State: AOJu0YyUqFiaw5Bg0/16O7juBibrEv5fljn/lv3Q/SzsyD8lNjrLdiKZ
	hg1Vd+twtHMomz5IXn8ziiHWM93KNU/4bdBCj1Itg8uZ3eKp4fQzoqS9CYYQbNnFol5wZoGC1Av
	Novb6BTtHotKJT0EW4QCyb58yXnvPePXUyul+jFxingM2FJ1fCUqNuPSF/UcQX7enI4xk3FlDGA
	==
X-Gm-Gg: ATEYQzwCHTA6QE8KVvNeQtLxBFabZvkIQ7vc44/qF2YvDpMHT88n3kKz0Gji+QiglkT
	5HEj/nl1vxripHKaNTUEAX9UniwEsph2gK+YmLOiatO135iUESk3ZRU3VmyRzWQcOO5hzyePmSN
	kzcMhl3U8xLd1kxUUvWUqs5X8qTgcuUtJxggy+mdaLRac1F1jcAJURv3Dlj8U2NGIbTaDQsf+vV
	/rgstvvKfuyym3pzJTy8jgHs1yHn3rvMg47vQdG0o9eDEOGpQvQBiwC3JnCGIESEiWYWSoZOjGh
	7O7LxEchjSL6JoL22c7rRvKEnlHzVSFF4VwcHmKKPUtsBUGQR7LLJf6m1mDLQRmsPdBVd41MBYA
	fyi0TyXjkW7UetDQMOA==
X-Received: by 2002:a05:6a00:330d:b0:82a:7b0b:f946 with SMTP id d2e1a72fcca58-82c869f89f7mr9625502b3a.24.1774776563946;
        Sun, 29 Mar 2026 02:29:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:330d:b0:82a:7b0b:f946 with SMTP id d2e1a72fcca58-82c869f89f7mr9625477b3a.24.1774776563436;
        Sun, 29 Mar 2026 02:29:23 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843e1desm4733804b3a.4.2026.03.29.02.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 02:29:22 -0700 (PDT)
Date: Sun, 29 Mar 2026 17:29:20 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-ID: <acjw8FQNrSSpEHqM@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
 <acc49s7jbI9Q3a4f@redhat.com>
 <20260327210929.f3a714186aed347f90f71246@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260327210929.f3a714186aed347f90f71246@linux-foundation.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-12333-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,local_config.mk:url,check_config.sh:url]
X-Rspamd-Queue-Id: 0AA1C3515F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > > d) within tools/testing/selftests/mm:
> > > 
> > > 	make clean
> > > 	make -j100
> > > 
> > >    compiles 3-4 things then ends.
> > > 
> > >    A subsequent `make -j1' compiles nothing.
> > 
> > Sorry, I wan't able to reproduce it.
> > Did you mean -j100 only build few source file but not the whole?
> 
> Yes.
> 
> On my 128 core machine everything up to -j50 works.  -j51 and higher do
> this.

Could it be caused by line#262 of selftests/mm/Makefile:

  local_config.mk local_config.h: check_config.sh
  	CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh

check_config.sh generates two files: local_config.mk and local_config.h.
Makefile lets parallel make -j100 hit a timing race around that shared
generation step. local_config.mk is also included, so if it’s being
regenerated at the wrong moment, make may parse incomplete state and
build only part of targets.

Try this patch on your 128 core system:

--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -259,10 +259,13 @@ $(OUTPUT)/migration: LDLIBS += -lnuma

 $(OUTPUT)/rmap: LDLIBS += -lnuma

-local_config.mk local_config.h: check_config.sh
+local_config.stamp: check_config.sh
        CC="$(CC)" CFLAGS="$(CFLAGS)" ./check_config.sh

-EXTRA_CLEAN += local_config.mk local_config.h
+local_config.mk local_config.h: local_config.stamp
+
+EXTRA_CLEAN += local_config.mk local_config.h local_config.stamp

 ifeq ($(IOURING_EXTRA_LIBS),)
 all: warn_missing_liburing


-- 
Regards,
Li Wang


