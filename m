Return-Path: <linux-kbuild+bounces-3272-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 392EE9630CE
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 21:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB18628691E
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 19:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D0561ABEAE;
	Wed, 28 Aug 2024 19:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VV2l2Z5Y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C341AB53B
	for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2024 19:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724872505; cv=none; b=UR4qbXnFwb1431eruoBusMjTcR12knO1DrWQOSd5livCFZDB5Kh1Qzpl96q1HudU0Srt4EecSXxDR6QWtlXp+RT+HO0iFPUWXQGku7ZjnfxlZi/CHgBWuhggNHWLjtcmi5VXggkQCwdr59sV73zabE2V91MQbumIBZSf1giREKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724872505; c=relaxed/simple;
	bh=LbQZQ/vVDRJDmBbeVufxWeOTUlxLOSsNWpUr0EkBfCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QxoMWgILt+4cUkZC8P1F4sa+ROMl4W5OJGQO2hwKi4qY4G3gr02W9bG2GTaSIFfKmoCy4Lw63cia2w72GMMI3g/k6UM2owTx07lBG8oEflSBJ+Lf7rctck2XHb6/iMk9geuriKrUcjglQ4XnjABnH5pr6uaNO/jl7EXSGJoHbcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VV2l2Z5Y; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724872503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u1UnXvwzw9mLNwzHOV1gSoNN+qWpQMXD0QiKEQ3cstw=;
	b=VV2l2Z5YjKAhvzNoYmqOIlIb0frXKjPa3STsYVjcIUjskwD1lpU484iiUrGEcc7iKMXcjQ
	slwfds/1LPsLA0mmXzMULFf1MYIz5XbjLGwJSFE8aJzp6X48W/zPX5EM49KD3z3GV+KYwu
	TzxCmyISAlwJWonB127bAjd2ax8XY+U=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-XThQpjJ8PEibi0dnCnwzZg-1; Wed,
 28 Aug 2024 15:14:59 -0400
X-MC-Unique: XThQpjJ8PEibi0dnCnwzZg-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 59D6A1955D58;
	Wed, 28 Aug 2024 19:14:57 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.93])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 449AE1955BF1;
	Wed, 28 Aug 2024 19:14:53 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Wed, 28 Aug 2024 21:14:49 +0200 (CEST)
Date: Wed, 28 Aug 2024 21:14:45 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: [PATCH v3] bpf: Remove custom build rule
Message-ID: <20240828191444.GA3806@redhat.com>
References: <CAK7LNATb8dbhvdSgiNEMkdsgg93q4ZUGUxReZYNjOV3fDPnfyQ@mail.gmail.com>
 <20240828181028.4166334-1-legion@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828181028.4166334-1-legion@kernel.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

I know nothing about Kbuild, I can only confirm that this patch fixes the
problem I encountered in practice.

On 08/28, Alexey Gladkov wrote:
>
> $ touch kernel/bpf/core.c
> $ make C=2 CHECK=true kernel/bpf/core.o
>
> Outputs:
>
>   CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CC      kernel/bpf/core.o
>
> As can be seen the compilation is done, but CHECK is not executed.

And after that

	$ make C=2 CHECK=true kernel/bpf/core.o
	  CHECK   scripts/mod/empty.c
	  CALL    scripts/checksyscalls.sh
	  DESCEND objtool
	  INSTALL libsubcmd_headers

CHECK is also not executed.

compare with, for example,

	$ touch kernel/trace/trace.c
	$ make C=2 CHECK=true kernel/trace/trace.o
	  CHECK   scripts/mod/empty.c
	  CALL    scripts/checksyscalls.sh
	  DESCEND objtool
	  INSTALL libsubcmd_headers
	  CC      kernel/trace/trace.o
	  CHECK   kernel/trace/trace.c
	$ make C=2 CHECK=true kernel/trace/trace.o
	  CHECK   scripts/mod/empty.c
	  CALL    scripts/checksyscalls.sh
	  DESCEND objtool
	  INSTALL libsubcmd_headers
	  CHECK   kernel/trace/trace.c

Tested-by: Oleg Nesterov <oleg@redhat.com>


