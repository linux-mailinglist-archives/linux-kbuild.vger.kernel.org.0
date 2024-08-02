Return-Path: <linux-kbuild+bounces-2785-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A629464E6
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2024 23:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E8FA1F2286B
	for <lists+linux-kbuild@lfdr.de>; Fri,  2 Aug 2024 21:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F127054657;
	Fri,  2 Aug 2024 21:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F2ri5abC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F6C1ABEDC
	for <linux-kbuild@vger.kernel.org>; Fri,  2 Aug 2024 21:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722633447; cv=none; b=EODyLIwNK0+k1LtL/IeHebmI6xGr9wojfW3rItInLNiJogT/WDkxuMd+ckr9VB8TUvWXE/292sl6GSWLUN9dzC0iX6xkgzGqQ9b4YJGN33bSufjW8IVRGOtstVrVEJIMa9uGgM4e6+IahQ+fhps+VvX4H4j3G11Cn6r9NP1cF3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722633447; c=relaxed/simple;
	bh=CJVx6hKBEtA2C6xwKu+85psWN00Yma38PQ634qW6kgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQ5DD5SvHjKaRucppAPtRs5tp7r6g6BolAWK2cHawOVdJne7FCs/MKoPUKmEpWp/P8qO+PV0Yaaf9+lxrsx9tnk+uzWZitBLTpZnzglxkPtC+Y3MQEhEtTg+LqmKGThZKcbz9cMfzFw2VwDpTRV6jf3WLgAbHnCs9w4hBfLsrg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F2ri5abC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fec34f94abso70100385ad.2
        for <linux-kbuild@vger.kernel.org>; Fri, 02 Aug 2024 14:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722633446; x=1723238246; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xg/nIkEBOUj6ERsU4SsqgIXyx4I9NBiRgxttKQa94Lg=;
        b=F2ri5abCF7oBW+vkjlG5z4/CWOMxso5IPddBFyPRStDF4+lR9Jw4uYb8vrEBl7Pt7r
         2I8mLYTPWP4xMtYR9UN8rFVDbQtAib4IoS6evsK/FRX9LXOh68Z0g+9kBZX6/kQnB4w+
         YT9sQQt9m2Ytu8J7cstEYo2oj8hdp+NBPeJFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722633446; x=1723238246;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xg/nIkEBOUj6ERsU4SsqgIXyx4I9NBiRgxttKQa94Lg=;
        b=tap3hvlBqaLpgHdC8nkKuNhSwcon/KUAYNkr5y4mLaqVdF9MqO5mdM+FZYe6MJV76O
         pmvVCbnTjO+7wLXYnN/EywDAxAbVAZAKDxlz3W69CSyMyztUQxSR44RgiSPY/E0nhQSv
         69Xn2EafEu3QfpzkCsH36dShgot1fuMveekc9Bc01XGb4Ctl29ZR63auVLCaSQLiu/9T
         PgxrJjcQpiF2FdEFyKfOktR1LsHh6h//mUtrBIc5udVkmH1lCKid072K8yBZJ2L1ZheH
         dQhvXIRgOYI5YBO/DzUQlp5aBI/Ojb7la+EeQAHs+l8uTntDowS9XbDq8/3EwsYUM8op
         s+Ew==
X-Forwarded-Encrypted: i=1; AJvYcCV6LE3PGRgCijHE3arKQOmKR2dV/pSw15ZaHHLQ3RYA9Tv7yl5N5hUCLkU2JAWEVXmOSYa5m0UXF0hzbusBzqLtwDDYDL8X6aCk2+uk
X-Gm-Message-State: AOJu0YwEs1t+6lRbntDQJlzRTGt1PKX9bJlOv/Ba6lvA9bBaQumGYl9N
	rjqfhWYBXEi3AHvDJMMOjGuUd7YTs9TQ0xxpi6DQ97tKSASMZbi3ixMh1/j3Lw==
X-Google-Smtp-Source: AGHT+IFFmu0KeHAGUS32wdXePcs4h01hwELYQaMMmW8APwdIiTFVYyrGB7g2Uh4wIWrPv5KZReIUyg==
X-Received: by 2002:a17:902:d492:b0:1fb:8419:8384 with SMTP id d9443c01a7336-1ff5722d6e9mr59497725ad.13.1722633445808;
        Fri, 02 Aug 2024 14:17:25 -0700 (PDT)
Received: from localhost ([2620:15c:9d:2:ac3b:d38d:edce:bf32])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1ff5916e836sm21683095ad.184.2024.08.02.14.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Aug 2024 14:17:25 -0700 (PDT)
Date: Fri, 2 Aug 2024 14:17:23 -0700
From: Brian Norris <briannorris@chromium.org>
To: Arnaldo Carvalho de Melo <acme@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
	Thomas Richter <tmricht@linux.ibm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>, bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Jiri Olsa <olsajiri@gmail.com>
Subject: Re: [PATCH v4 2/3] tools build: Avoid circular .fixdep-in.o.cmd
 issues
Message-ID: <Zq1M43UGQCkdLBNn@google.com>
References: <20240715203325.3832977-1-briannorris@chromium.org>
 <20240715203325.3832977-3-briannorris@chromium.org>
 <ZpYngEl9XKumuow5@krava>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpYngEl9XKumuow5@krava>

Hi Arnaldo,

On Tue, Jul 16, 2024 at 09:55:44AM +0200, Jiri Olsa wrote:
> so usually Arnaldo takes changes for tools/build, Arnaldo, could you please take a look?
> but still there'are the tools/lib/bpf bits..

Would you have some time to look at this series and whether it's ready
to be applied? Several folks have already acked one or more patches.

In case you've lost context on the series, here's a lore link for the
cover letter:

  [PATCH v4 0/3] tools build: Incorrect fixdep dependencies
  https://lore.kernel.org/all/20240715203325.3832977-1-briannorris@chromium.org/

Thanks,
Brian

