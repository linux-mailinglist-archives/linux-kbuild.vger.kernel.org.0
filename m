Return-Path: <linux-kbuild+bounces-5810-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8587A390DB
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 03:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAA0118892D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2025 02:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C217DA82;
	Tue, 18 Feb 2025 02:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WqlLhH9O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7434315E
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2025 02:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739845630; cv=none; b=If1xm/qWRvb8IDq41WSKcIsti2XbpGA7y2XX4XBfGnPRRt3tknyA0ATTDjQCoOyU4kntlHrxNwBPzXQw7Guqpvd+gKZl3/LiXVGuM47rgKWPHdiPG8INy4umhxeUEuJYlp03B9dd942MOzODU3QAGwuDBGHjgTAGfM7DFrtKyDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739845630; c=relaxed/simple;
	bh=7zPquDCtZyzOA5PY0kmGl8Aq5WV/QI7GoaYVVezsWQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4n+7mZfDz8iqTfuhUsDB087t/DkygBbLX6IePoEMewEpmh1EDAHfsvqQYLClphGGRqunBtTFqRfR1k7hkuz7cnNcicpWNsxZCVlBzSAcN85kL6/MOqGASeqYKy4d+vCHkch5g8wflDxpJ2cx4fGHW4xY0Cxyym1RMVitz1xqqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WqlLhH9O; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-2fc1843495eso6324945a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Feb 2025 18:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1739845628; x=1740450428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zPquDCtZyzOA5PY0kmGl8Aq5WV/QI7GoaYVVezsWQc=;
        b=WqlLhH9OWfdW7oxlmQ9M0HGCyvSjcu9z7Q0uFyOvC8qhY+b+NRzz2L9Fdhfbf4qqzL
         +/XeWl6l/bLcgZxxd7QRiFKEQe6/wt11fldtwEY9Vigq/jzKys9m2vbUuyXxJbWh+0r4
         dNWpffqQbEafKI9B0A+V2Ouj9/jGr032JgpmYIY6LYzkkOr0KLAJJhB8Mc4uVpQDipvF
         K/f5cqGmZYrUw7Q0+pCwrnr+prVEMiNW0iSMm9x6tWR5feJBd4JNkkEUbWnbbcJLzhcM
         Gbm56W/r0cqcxzdlK8nx13zyozsEZAygo9h5JKlwU7YgIxM1uzSPV6C4ep0i3d9XnER1
         fnlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739845628; x=1740450428;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7zPquDCtZyzOA5PY0kmGl8Aq5WV/QI7GoaYVVezsWQc=;
        b=hA8+jWsc7aJzHYDXemEZUEUBsRFhIvblEetJUcTFaQRkRtU7alPwJ2GP/WKpfD6i5I
         Q5y5cGXncjeAtnuHQdYFHzQrfpnB9bWOA8nzpgqZ9uOwV9PQ3Hw6VflnoDQnsImkTEsG
         aUTj1zNOPQdfMO9rjObJnpGxOW62B1RvVIAQbsXSVKZN4o65SdTndG3gzJ/891LLH3MA
         pp3oaoK1o8yh5gkIBDoUyAQ1sDJnkTtJhatNM32H3xlE8Jh8d9wEpuVF3/EoMc/h7ZMC
         WO23yF8s01saaAQstC+Pd2TV9I5xsHBCv5Vzja6LGsCPNZtilqEaSTdMyjZd+7nFturA
         q2lA==
X-Forwarded-Encrypted: i=1; AJvYcCUAxbfdGudOf7xfyK9eRABT0Apmuh6Ei6REOKRUEFAT/46DaAGhW9NamkIOb9XJIWkiYL1x/0Fo2J2GhNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfhFxLEBCFQx2JRWHn6h1VjF5L/Bkt4WdKT3dAj/VAoNgoI6H/
	WkVse+w1MiSMIIk4Rhzwbk5hdxESVGAISEnPme5MiscylWJ0C1FVcxHFFRxcOyIfHRJ0ktkV4LZ
	XZ+67Bep/zVSgv0FaHIkkyugPYE0e/o7A
X-Gm-Gg: ASbGncusqelhFbRfkKQIhP1J2yfGmzwTqWAPDAXxhCNOjRxlAW/eAwG0mbslt+OL5D+
	t7T5/I2R22M5QfoM74qem2QBNT5szMUIc/ZtGDHU7LH7GUukhEIStsBnTMTCUAJUuSD2PwdGTUS
	QiQ8/f+/88Zf2ilrpeoxPtz3XIS2oYRTXOz5hZmYbth3TletmHOczoRKHdVAKgXi4aZi75PsMoQ
	uaHTR/FyFO2aFXd+o8O3pA2TB1y9BtHDlTE+I1qrcOaMzHqTfwzzEsMpq7dDecCroqPIQfmQPc/
	dmGlo9SBZionJk0bvg/cpUG/l609CPrWlDXRi38=
X-Google-Smtp-Source: AGHT+IFFsmcWjjCoUpJdI8DVltS/RAsCrCDYNhF7gxUsUHOmvhlTvF9lASrmxXF2Dsj9RkXrgNTuPvfYKXXF
X-Received: by 2002:a17:90a:fc4e:b0:2ea:7fd8:9dc1 with SMTP id 98e67ed59e1d1-2fc40f22da7mr21187725a91.18.1739845628055;
        Mon, 17 Feb 2025 18:27:08 -0800 (PST)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-2fc13ba74d4sm599877a91.15.2025.02.17.18.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 18:27:08 -0800 (PST)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 4617E3404B9;
	Mon, 17 Feb 2025 19:27:06 -0700 (MST)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 3A15CE40F89; Mon, 17 Feb 2025 19:27:06 -0700 (MST)
Date: Mon, 17 Feb 2025 19:27:06 -0700
From: Uday Shankar <ushankar@purestorage.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 0/2] kbuild: rpm-pkg: improve debuggability
Message-ID: <Z7Pv+hD3AOS/ymFI@dev-ushankar.dev.purestorage.com>
References: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-debuginfo-v1-0-368feb58292a@purestorage.com>

ping

