Return-Path: <linux-kbuild+bounces-1541-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C06E8A364D
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Apr 2024 21:26:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA1982823E4
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Apr 2024 19:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF90023778;
	Fri, 12 Apr 2024 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b="ZSsuj/Ge"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0FD14F12E
	for <linux-kbuild@vger.kernel.org>; Fri, 12 Apr 2024 19:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712949970; cv=none; b=JDfG+3nU8rOhGaYMM7vexn3TcCLnYvyZkcEBKb1Twx55a/6ff7qa8nUjbypOlDpr24J5AnxBtwPs82fGD5MuZaWMgQQwYwXoIqzd2POjSNfkq2S4mO5RBhfMC2wxz30tYwTQcazLpN53nd+TCjoPyrR2sL0Spq9lbxlSOsUXNR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712949970; c=relaxed/simple;
	bh=eYKYUnIbe4yAEfAMfbPFL8XotCy/MMB0Onhvc8YTN6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZCVqW+RJaCQOvU99kUj0INWTmQ3WBf2qPafOLzupCQapbCVV5Lydn9M5oVmsmz0DYPkFIgE07nR+5xIm/OCve+QVg4sS6oZQYgrYz4ZLVKDEa1EJqY/ii8a17MRvEYKUTIZTAnquyPcSX/qc27NRuxSlQ9zuBpUuN8ilzhOisE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; spf=pass smtp.mailfrom=wbinvd.org; dkim=pass (2048-bit key) header.d=wbinvd.org header.i=@wbinvd.org header.b=ZSsuj/Ge; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wbinvd.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ecfea4f01cso247725b3a.0
        for <linux-kbuild@vger.kernel.org>; Fri, 12 Apr 2024 12:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1712949969; x=1713554769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ps+47mM0+7BT6EQDFy0dqt8BKlRMH8/BPpupOPVP7+M=;
        b=ZSsuj/GeJT+mSNm9ULpVIlRwJA2GsZLFZkDGha+YFexJ/Hj8KE7Gy8hXnImGdbCmj/
         seyzU61yCv3HIXPo5oEeXkhWrw/knpCGG8RtJbqU5+H122bTUyn5wHnVKzKCVHKxgpd5
         +K3G0m4GvFu1LJ/+UkCueQTYECRCuVHtwOfupTk5Suo8i4L2v91Wgoqb/cgpeepQ+TiC
         83CM6TvpkJUtYWKwYSM0UoW60yPbtuJYjNrigKd2rM5+b2ME2ne9SNrovE81aIod9gcC
         3iol3dvHZfGojlj1V40Gx3DjzsIZi5h4jbFtIUANBpHR0iclCIQVI1yLcV3SU02NuQhM
         njlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712949969; x=1713554769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ps+47mM0+7BT6EQDFy0dqt8BKlRMH8/BPpupOPVP7+M=;
        b=g/jlwj7+zFTBTfwRHWE4ZRsBOxX4L7A+BwZzwANgckRsOijk4OAKnOsJVXt42dK3yy
         4QzqxZXNqfAGTb64e+Xx1nxAWlPvmR6HmUq/iMVcyey2E3MWMnm8t73hXjazope3UrSt
         lp+3umxo2jpFsnc6wCae291mEmvF0jfLBxgFsoeWojmcfF3Nj3T2ykKNSTgSb16FyxKb
         mBw6Yr6DDNrmisiIum/EaMhZaDjeJljjqfSfKkI1ZFHmwcAltcxws2urge5doYmc868j
         i5uIkSaMvx0OOOCnXr83dk8Y6xnsmjv8oQcdM8E3vTnhTAoUQhiIEwOY6cyPUhg00VTz
         L2vA==
X-Forwarded-Encrypted: i=1; AJvYcCXzc7zoj0UvXIglY9bNlXy8Uu1XicQpyQGgaP9bXOziX0ERBTE75l4+GTQoNioUMbJexOWYnoJf9sVfSGD+P6P/t26btoCOOUZqzZQg
X-Gm-Message-State: AOJu0YwbjivqmdSRC7orqDciXpaCK9S8XxWpYeaTQvDZ174XpsCDa7dq
	vV7TOCazBtnrf8mXw6MfGk1NE8M58UcXIjhEOa0CfR06LlWqIK6THWalxO855vGzEJ2V+8NYkED
	q
X-Google-Smtp-Source: AGHT+IFuRd1V79mWYV4om7cs7u+T26j07zRGddRWY1Mkss3MCeVJr+N/0EpyaqgLj8HBxUfYiNSiXg==
X-Received: by 2002:a17:902:ea0e:b0:1e4:397b:492c with SMTP id s14-20020a170902ea0e00b001e4397b492cmr3861161plg.4.1712949968738;
        Fri, 12 Apr 2024 12:26:08 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.85])
        by smtp.gmail.com with ESMTPSA id b4-20020a170902d30400b001e530aab374sm3336728plc.194.2024.04.12.12.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 12:26:08 -0700 (PDT)
Date: Fri, 12 Apr 2024 12:26:06 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org
Subject: [PATCH v2] kbuild: buildtar: Add explicit 32-bit arm support
Message-ID: <ZhmKzqxHXaSZmXee@mozart.vkv.me>
References: <e7c14a0d329e28bdcda21376b54a43c85a4aaf3f.1712682861.git.calvin@wbinvd.org>
 <20240410170450.GA1828262@dev-arch.thelio-3990X>
 <ZhcZCwMmANQS39s2@mozart.vkv.me>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZhcZCwMmANQS39s2@mozart.vkv.me>

Implement buildtar for 32-bit arm, so the zImage (or xipimage) appears
at boot/vmlinuz-$foo, rather than at boot/vmlinux-kbuild-$foo, matching
the structure of the tar-pkg on arm64 and other architectures.

Link: https://lore.kernel.org/all/e7c14a0d329e28bdcda21376b54a43c85a4aaf3f.1712682861.git.calvin@wbinvd.org/
Signed-off-by: Calvin Owens <calvin@wbinvd.org>
---
 scripts/package/buildtar | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/package/buildtar b/scripts/package/buildtar
index 72c91a1b832f..86035c990aec 100755
--- a/scripts/package/buildtar
+++ b/scripts/package/buildtar
@@ -101,6 +101,9 @@ case "${ARCH}" in
 			fi
 		done
 		;;
+	arm)
+		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
+		;;
 	*)
 		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-kbuild-${KERNELRELEASE}"
 		echo "" >&2
-- 
2.39.2


