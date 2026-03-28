Return-Path: <linux-kbuild+bounces-12328-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIcsGwY5x2nSUQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12328-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 03:12:22 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FD034D07E
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 03:12:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4783C301DD30
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 02:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 860B1352C22;
	Sat, 28 Mar 2026 02:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TYGaado/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZZlVgckk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219CB2376FD
	for <linux-kbuild@vger.kernel.org>; Sat, 28 Mar 2026 02:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663936; cv=none; b=hMC0NMJW/VvofKJncMpqgtYgUNp3pdkcwrkK7OUOIs+PGk99qeB3BV/1errmkd83AJ4oAuRVFJ0kuLjatEBNwg+i+fwxcJzdi026dowGh5hvu/VysEFVjORLGvvKpk4TChpZgoz+kIKALmE8RERCKZhSAp6TWk7DOMgAlIyZ+k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663936; c=relaxed/simple;
	bh=R0hOUyUw1S43YOqTcBVweQ4HGlJUUJRlRmz8ISCMmVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UWK4qJtbzD0P6z2HUCxgDrsY1zPCPQbqQVMth4QGCmZHxkBDGftKwIMXGw+EExUk9oZCiQkfOdxhShiSPxoinN/QZ/N6/dX4WQ4eGhneMf0c/tM0ViPf8nUQgZiTSjEqEdCRRDPhtMTAp40vKHHJWm2gch5K+UBQJc7G0oTNuv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TYGaado/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZZlVgckk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774663934;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K5pAJhZCqE5oESJaENRwjHgVA6xECCslqT3Zf/bfI5M=;
	b=TYGaado/F6Z6DqpNbYKoqQid/rF2JqNIW8GdUa5WVXXr6i1tQCiZC4jilagvyMEulnjF1k
	3jF3MVq/qAD0Ctt6mUn7IL0u7qSqITL3grRd/4o9qV6M39Q0HJ35lyivz5VtZTkK3/sSK7
	ttt7Nb4/55CQUzfWo01fjUQ2v1y06nA=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-kLn-NDu_Md2A8I2K-9AAyg-1; Fri, 27 Mar 2026 22:12:12 -0400
X-MC-Unique: kLn-NDu_Md2A8I2K-9AAyg-1
X-Mimecast-MFC-AGG-ID: kLn-NDu_Md2A8I2K-9AAyg_1774663931
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35c1107da15so1176426a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 19:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774663931; x=1775268731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K5pAJhZCqE5oESJaENRwjHgVA6xECCslqT3Zf/bfI5M=;
        b=ZZlVgckko9dzux7Z89by5maNgTYPVaSZkn2smtnMg7v5gBOJaxUU6OnE5FFeoAPRS4
         OmdHIvCliWNk9sCjYyeo652O2EJwVoc62jD1UDhR7eIXpYj+0fLYNcjScEjxHZDwNHjk
         O/ifjZH5cmuJZhKs2yDN9NXIh4MLyCcCwlsT3+hC0eXFJzYbU9m0BF6LuzktWB1Rb2kR
         8gbasNg3J2V8mu1vM5h/fsOknNOvyUGdSXyCIMrPw5JS3rSTWm2XCAwtzk+Se0kBi6yn
         wDLiTbm47rYmiK+Clk9NoKRgthUv5O5yTu5y/tYQ9L9gvK43uptq61ZI5QhfMdnL5ENq
         gqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663931; x=1775268731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K5pAJhZCqE5oESJaENRwjHgVA6xECCslqT3Zf/bfI5M=;
        b=lUSzbS4oJYdj7ad71cWskUYvY6A5J4dniQzTJPUMn27sldEi2A2JaxvJp8fkk7IsLf
         KXGFQ8MyjH8GkXDo/sXOp2GQOy4p6UCtsjpNKOkB4/hPM+U4lhbhLIlgOxzSOhPPDRj7
         dUGMh4q08BbksWO+1JSB9EV5gt6bdswx9PwWw/CbhtWVQf8RVXhk0p62rdELEkAV2txy
         AAdix+Pb56OjCyTvjDari1VBEq7ziM3Eco/PpAFIvoGjG5RfbGyFdOX7XajOasGyTXiv
         mJRTpF9kXtgSXHC0cNQLUz9F1JlHfjC3uWpiJq3YeItimFDXJREdK4H2KvH6FkxHyK7I
         V7Qw==
X-Gm-Message-State: AOJu0Yx/rydoidJPf9K670xAssyURs1dPjPJxjCeKDwIQ14TqNhERaeM
	ccIOKmdX2wJBa7J6QMq6/vgj46ctPulXLWNYkfeMJLvl1LIA4TAP0AUWomugE0hVIxv6ZLMnetO
	7Q7Vfbi/XoTKt6X268YzaRamTP6zQF3lQ1VtbZDn9atk8RqwlkiwWHEBBGnLbiqCm5A==
X-Gm-Gg: ATEYQzxxNxsZC2PQC+MNIbguwXxbISK58OT9JtleRZv4Qymm4cTDTF2Yf41wtLLGkTm
	VQfqdo8301rfJ24c906TpitG3hhivj2tOSB8Gk5L0M29gOPadZcUuFces6LmM+mGlHvTp0UH8OK
	ooudPV6mwAg3jrGvyIpb81ctVEKhnft/fWv/JzV/Q54PulIxugKpPVcVQtl2Lgy6gorxO4Cys5s
	JZplIHoWHoMNgcqm3fa5k6qH60SQBz0H1km6ib/uaDTykd4a00VMXBzgWBtcK9jiM8xA0xLgmwb
	zA2syhfN/fECSaSIN7WX6PzQGLroJ8jyyBQH4NkkcW62+NgloRqFdjPKRWr+kmbZjj8swvCB+Ue
	Zc90mhvmU+UhnjeaAhQ==
X-Received: by 2002:a17:90b:2f87:b0:35c:d98:d685 with SMTP id 98e67ed59e1d1-35c2fd94735mr4735948a91.0.1774663931086;
        Fri, 27 Mar 2026 19:12:11 -0700 (PDT)
X-Received: by 2002:a17:90b:2f87:b0:35c:d98:d685 with SMTP id 98e67ed59e1d1-35c2fd94735mr4735923a91.0.1774663930573;
        Fri, 27 Mar 2026 19:12:10 -0700 (PDT)
Received: from redhat.com ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c2eaf1dbfsm1622400a91.3.2026.03.27.19.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:12:09 -0700 (PDT)
Date: Sat, 28 Mar 2026 10:12:06 +0800
From: Li Wang <liwang@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: tools/testing/selftests
Message-ID: <acc49s7jbI9Q3a4f@redhat.com>
References: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327143234.40bb8a0119bd55670ddfeec6@linux-foundation.org>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-12328-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liwang@redhat.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57FD034D07E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 02:32:34PM -0700, Andrew Morton wrote:
> 
> whinges, perrmanits, maybe I'm doing it wrong, etc.
> 
> a)
> 
> At the top-level, neither `make mrproper' nor `make clean' remove the
> executables from tools/testing/selftests/mm/.  Seems wrong?
> 
> b)
> 
> Shouldn't I be able to run
> 
> 	make selftests
> 
> from the top level?

Should use:

    make kselftest
    make kselftest-clean

> 
> c)
> 
> tools/testing/selftests/mm
> make clean
> make
> 
> does:
> 
>   CC       droppable
>   CC       guard-regions
>   CC       merge
>   CC       rmap
>   CC       soft-dirty
> gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m32 -mxsave  protection_keys.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -lm -o /usr/src/25/tools/testing/selftests/mm/protection_keys_32
> gcc -Wall -O2 -I /usr/src/25/tools/testing/selftests/../../..  -isystem /usr/src/25/tools/testing/selftests/../../../usr/include -isystem /usr/src/25/tools/testing/selftests/../../../tools/include/uapi -Wunreachable-code -U_FORTIFY_SOURCE -no-pie -D_GNU_SOURCE= -I/usr/src/25/tools/testing/selftests/../../../tools/testing/selftests  -m32 -mxsave  pkey_sighandler_tests.c vm_util.c thp_settings.c pkey_util.c -lrt -lpthread -lm -lrt -ldl -lm -o /usr/src/25/tools/testing/selftests/mm/pkey_sighandler_tests_32
> 
> why did it start emitting the gcc command lines?

Those two binaries (*_32 / *_64) are built by custom rules in mm/Makefile.
(Makefile: line #218, #226).

Other tests use shared rules from ../lib.mk, which are quieter (they hide
full commands and show short CC ... lines).

Maybe we need:

--- a/tools/testing/selftests/mm/Makefile
+++ b/tools/testing/selftests/mm/Makefile
@@ -215,7 +215,8 @@ ifeq ($(CAN_BUILD_I386),1)
 $(BINARIES_32): CFLAGS += -m32 -mxsave
 $(BINARIES_32): LDLIBS += -lrt -ldl -lm
 $(BINARIES_32): $(OUTPUT)/%_32: %.c
-       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+       $(call msg,CC,,$@)
+       $(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
 $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-32,$(t))))
 endif

@@ -223,7 +224,8 @@ ifeq ($(CAN_BUILD_X86_64),1)
 $(BINARIES_64): CFLAGS += -m64 -mxsave
 $(BINARIES_64): LDLIBS += -lrt -ldl
 $(BINARIES_64): $(OUTPUT)/%_64: %.c
-       $(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
+       $(call msg,CC,,$@)
+       $(Q)$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $(notdir $^) $(LDLIBS) -o $@
 $(foreach t,$(VMTARGETS),$(eval $(call gen-target-rule-64,$(t))))
 endif

> d) within tools/testing/selftests/mm:
> 
> 	make clean
> 	make -j100
> 
>    compiles 3-4 things then ends.
> 
>    A subsequent `make -j1' compiles nothing.

Sorry, I wan't able to reproduce it.
Did you mean -j100 only build few source file but not the whole?

>    Whereas
> 
> 	make clean
> 	make -j1
> 
>    compiles everything.  Slowly.

Both -j100 and -j1 works well from my test (vm: rhel-9.7, x86_64, gcc-11.5.0)

-- 
Regards,
Li Wang


