Return-Path: <linux-kbuild+bounces-3582-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA8197A8D7
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Sep 2024 23:34:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81A9E285D65
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Sep 2024 21:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B56313698F;
	Mon, 16 Sep 2024 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WWekezk3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f97.google.com (mail-wr1-f97.google.com [209.85.221.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224785588E
	for <linux-kbuild@vger.kernel.org>; Mon, 16 Sep 2024 21:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726522451; cv=none; b=cSkNBuFyfBAJg37a9xHByeWoO9YAz84s8egKtMwta00lzXtaR7j5Hs46ZwBOPhHRRMR5+7lc6DaDN+QNSMYiW08eLMGjds4bl/TopKOA6kl1rJiVH2GANA/GTsp5Sl9sO72/7wW26IE4idcbeYOnqogjkHuOU32kJbXKuuo72xI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726522451; c=relaxed/simple;
	bh=7zPquDCtZyzOA5PY0kmGl8Aq5WV/QI7GoaYVVezsWQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqliFredl9X9GVTaBxTwGc5bSySAgV8aYOdICVs7mWHYQTx8GB9S3aCIu505QNOLcPgqzH9YznSrALljyarFzq2x47NTwT1VOX60bfzPPx4Pb/2yhLs6OGKDoDMypuU69jFJUQ2g3nJmbE6fwL5qjc4/9XHaJWVeN6VEYROjQKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WWekezk3; arc=none smtp.client-ip=209.85.221.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-wr1-f97.google.com with SMTP id ffacd0b85a97d-374b25263a3so2481728f8f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Sep 2024 14:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1726522447; x=1727127247; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zPquDCtZyzOA5PY0kmGl8Aq5WV/QI7GoaYVVezsWQc=;
        b=WWekezk3Z6suXzKdReRaGwlgv+RH5PGPU7Wn81QVt1rGgiG4hrLCOor2bzzGkKL927
         +2Ks4v/IG3JnWZLojyHsbE8M4dXqcoj5b9RCzeNRrPK/4hEo3ac48baxsMT6eq1u923E
         AEC/WsrFn31nRjkkFj8ycQiXjwcjS/u9qlGVPUBeRq0ZwaCUCQuleMFx2BpOhH+4FJa4
         kSJY7tG5Kc7v/0fXYDuDN64hB6VSYlbCPR5cHvIzHT0MZTvnkPYR/12eB1qFm0jl3f0E
         Es4ec0wbq3tLbkyMRLkKA/N0ZR3eHMCCJpt6Ml6fXy4X0x6G5Mry1d5uv35pgXftOpIK
         bZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726522447; x=1727127247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zPquDCtZyzOA5PY0kmGl8Aq5WV/QI7GoaYVVezsWQc=;
        b=oAWYOrx3p6askhg4WCI3MUto2jJyfEt3QKJfppdru5phdD7ggPzvcVL2JNNzeMyEDa
         IV5ggWrVXw/8EwozbP76JN18/RFvFLk8SB9b+85G1oqA6RU+m3r0gSgCZ7K1GR8Jiqec
         SmXv8kQWwiJvDFKsmaV4igDsJYl/fruzp0FuLMPYz5lf6qVZbywSyC+OAe/+r+ByVYcd
         KOnVhvPgI4cN6QiPbC4DpOQ5BtzmkmX0rR794/ANV9E2vMzKGm2OWVaPrw4BrF6dosA8
         wqt9Vsh1qTqO34u2XyXpdqx5LZPZBFEGQ9FsFQeVcUFYZbNhyTCwWa77Sa3Qd8yazXp6
         lN7g==
X-Gm-Message-State: AOJu0YyUWXjgFdpzEGeqsha/A6ZiVNPzdJsjMxXvtjKPQQmeHiyemKgo
	Y74ir5BS8uHGhWHGCJJoGGD+y/1nQBvyMnaOq14zqRiv+FFim0cJ3/gvu64XbHbrULYSSCWYFx2
	DAy+QYW7z6939wbqwgmrdsRlsxS4WDdpp+rSLK/CQPh8vWDg3
X-Google-Smtp-Source: AGHT+IGI6XHJ+0ieI3PJaqxZHGENMxOAgOg2rn2adZPSATp0ORszP+XifEllzpaA3nNddz+0qNoKrmTjSPVQ
X-Received: by 2002:a5d:6445:0:b0:374:c8d1:70be with SMTP id ffacd0b85a97d-378d623ae04mr6894606f8f.38.1726522447164;
        Mon, 16 Sep 2024 14:34:07 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id ffacd0b85a97d-378e75f1d06sm260525f8f.53.2024.09.16.14.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 14:34:07 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [10.7.70.36])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id E830C3402D8;
	Mon, 16 Sep 2024 15:34:05 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id DA818E4018A; Mon, 16 Sep 2024 15:34:05 -0600 (MDT)
Date: Mon, 16 Sep 2024 15:34:05 -0600
From: Uday Shankar <ushankar@purestorage.com>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: rpm-pkg: include vmlinux debug symbols
Message-ID: <ZuikTZc5D+2YDgxk@dev-ushankar.dev.purestorage.com>
References: <20240910014327.1726214-1-ushankar@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240910014327.1726214-1-ushankar@purestorage.com>

ping

