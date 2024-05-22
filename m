Return-Path: <linux-kbuild+bounces-1916-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 369868CC07E
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 13:44:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 678FD1C2254C
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 May 2024 11:44:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A12BC130ADD;
	Wed, 22 May 2024 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f20xYOjL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1E712DDBF
	for <linux-kbuild@vger.kernel.org>; Wed, 22 May 2024 11:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716378275; cv=none; b=FHvMxpOb6maiGtcfPXPk53e9xcC64QqNGJvnlxkj+kZaNon4Echd7rDYP/UIsPDeN8aA9anXIp4QmR+jxaHSNNZgQ+Dy4Rbn3Z0ZYJsQLXvPTxRY7Sm7mPtMowckm8EPJQ2vk2nTJ/Yq7rQF61MQ6knLUeXYaLQ9zTRLwY4vlKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716378275; c=relaxed/simple;
	bh=LpnRNcJij0yq/HxvAH4NrOsBgPjXV73gGgD3lrbBeFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iNTxIbg2gjiNmaifnIzwXaxdHU8ciZpCFS7HQHGiO3ryUSQLVvk7nS0DnXnaIEJFU9vIyquPBYyPfX9rogdgtfdAYcrICuoPeNeCKkHdV40cfaeD5V2peWO1A5C+byQkaO71uCUlK8RGLxsRsPVywc+227yBrsJ8CuyoG6hpqnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f20xYOjL; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e1fa1f1d9bso86317521fa.0
        for <linux-kbuild@vger.kernel.org>; Wed, 22 May 2024 04:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716378271; x=1716983071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=voS8iBC/CPfmqha7lxiV2JBUbAAWG1gJ26sqax7yLe8=;
        b=f20xYOjLwWwoZQ2vjy2vQpiKvFK5HJ1E1GmFEWFgELk+HuWiujYJRV02yqVXMGAqCq
         cJO0UISh2o/j9udiybFmRT/Nzqjm74Of1aBZzcwy3rDa3/QY8nvpj+yXC96YGZgZ5aXd
         /UGGaT/gZXvoSuW/Slh3JSRe2iJU69BvedXeDTT6Sw0DId1qlYkTRNNYW/e2RDhT95cg
         gbNCWtyDbaIckDtW5wgtRV3iIospmYd81O5Q4QYwm7X3UDK8AhlIfMDKh/Vp0LbhbO4p
         Yg9S7CVYSB5ckXRDc0nXKwhfuMaBpTUZ0wXECGbIKII9f0XMRuPb1uQFpPkH/T7LEvSQ
         r//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716378271; x=1716983071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voS8iBC/CPfmqha7lxiV2JBUbAAWG1gJ26sqax7yLe8=;
        b=gAiD5aiLW5fN4KGS1m09gI5oh6iAvsL1ElusaYpio0TXOUZSCn+b8Nt9WyPr9Yrtmj
         mCJcms2V2UXStEdI+3oMQpFHz2BOrSfabJOJV5TRu/EvW2H9G+GY+xyhUp4KC2EUBahe
         0TNIImqhznebH1sADdKou8oKATniH7ONfAYHw4azQBbdifhXS4z64m9PNd2TChOmgbPh
         GF36aaRLnBdo6MkHuCXhQnxLb0hoX4aLYuQz9L8j7Cjp30tG+qXjsXYZ43Ugd3sKG0wA
         EVyazdr2EaVFtbxny3nwh0OqMldIX98yTGj+FHWaC46gxPLkZzABkitz2SA6PtA02kn/
         nwqg==
X-Forwarded-Encrypted: i=1; AJvYcCWgIxXrLH7I7oLasoupvyX9zZ1l3BCaRQyxywNBHY+PJ2ksFbCD3HPIBx4poJd2owRiyO9noUPI3GnjcuUWaiaendIHHbqBoc0jOoxE
X-Gm-Message-State: AOJu0Yw4bw6+bruhHjYSbkDafq1ukfjfzCX14yuNTCviG16RCbwwVJ65
	HbfAqZx+BhFX8jrlDDLTK3dB4v7Bqju3apSa99HPaRi4zub4jn2stVJwZqEr7k0=
X-Google-Smtp-Source: AGHT+IE6UsVgyNWxEj1Qq4n1+brostMB59DhOJ0AltqQqX31WU0Ago4GOZq97qgQ7AygtP3IFrRPug==
X-Received: by 2002:a2e:9210:0:b0:2e1:c448:d61e with SMTP id 38308e7fff4ca-2e949466c14mr13483761fa.15.1716378271019;
        Wed, 22 May 2024 04:44:31 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17892450sm1778426066b.63.2024.05.22.04.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 04:44:30 -0700 (PDT)
Date: Wed, 22 May 2024 13:44:29 +0200
From: Petr Mladek <pmladek@suse.com>
To: Lukas Hruska <lhruska@suse.cz>
Cc: mbenes@suse.cz, jpoimboe@kernel.org, joe.lawrence@redhat.com,
	live-patching@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, mpdesouza@suse.com
Subject: Re: [PATCH v2 6/6] selftests: livepatch: Test livepatching function
 using an external symbol
Message-ID: <Zk3anchjqeCkZmU5@pathway.suse.cz>
References: <20240516133009.20224-1-lhruska@suse.cz>
 <20240516133009.20224-7-lhruska@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240516133009.20224-7-lhruska@suse.cz>

On Thu 2024-05-16 15:30:09, Lukas Hruska wrote:
> The test proves that klp-convert works as intended and it is possible to
> livepatch a function that use an external symbol.
> 
> Signed-off-by: Lukas Hruska <lhruska@suse.cz>

> --- a/tools/testing/selftests/livepatch/functions.sh
> +++ b/tools/testing/selftests/livepatch/functions.sh
> @@ -7,6 +7,7 @@
>  MAX_RETRIES=600
>  RETRY_INTERVAL=".1"	# seconds
>  KLP_SYSFS_DIR="/sys/kernel/livepatch"
> +MODULE_SYSFS_DIR="/sys/module"
>  
>  # Kselftest framework requirement - SKIP code is 4
>  ksft_skip=4
> @@ -299,7 +300,7 @@ function check_result {
>  	result=$(dmesg | awk -v last_dmesg="$LAST_DMESG" 'p; $0 == last_dmesg { p=1 }' | \
>  		 grep -e 'livepatch:' -e 'test_klp' | \
>  		 grep -v '\(tainting\|taints\) kernel' | \
> -		 sed 's/^\[[ 0-9.]*\] //')
> +		 sed 's/^\[[ 0-9.]*\] //' | sed 's/^test_klp_log: //')

The prefix "test_klp_log:" is not used anywhere. It seems that this
change is not needed in the final version.

>  
>  	if [[ "$expect" == "$result" ]] ; then
>  		echo "ok"

Otherwise, it looks and works nice. With the hunk removed:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

