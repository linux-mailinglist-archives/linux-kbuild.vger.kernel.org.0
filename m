Return-Path: <linux-kbuild+bounces-2129-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1BE9091F8
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 19:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12FD4283AC3
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Jun 2024 17:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADC51974EA;
	Fri, 14 Jun 2024 17:46:53 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466019D89C;
	Fri, 14 Jun 2024 17:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718387213; cv=none; b=qxoIC0R55vGOWlOEMu0CEPXglDKCymeq03J0D9HFgoRqkIY1kEW1AVkdFX1tL5A7Nws3Mkzn+Grhs6QOAWy6LBjUg7Zebq4xl+eaSRUhjfjzn8iwizmbzZcDQMa67k05g2+6AtD8mzeShg4ZIX+djPFCIXMOpQcy9EqhW9L3dSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718387213; c=relaxed/simple;
	bh=RORB+zb23DcV9RCrRL/YDiqRnMupOiDZ3d4zA6QVmBk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L6wyqkQjp1UAmTzOaU+ey706H+s0cYJ4HRvKeDVFZ+WEyfbDOAyGEUrcqtNHSd0sZ4Yl0rsz5v10iqi48usZgPJdHskhl00M2z4Nkq4bMvvUYfnYj9uwElAR4sVJq1tva9jVdF2HKkjbhugn9gJAJwdzH4e8j4mJ9Ahgw0MRI0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 525AFC2BD10;
	Fri, 14 Jun 2024 17:46:52 +0000 (UTC)
Date: Fri, 14 Jun 2024 13:46:51 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Kris Van Hees <kris.van.hees@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org, Masahiro
 Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>, Jiri Olsa <olsajiri@gmail.com>, Elena Zannoni
 <elena.zannoni@oracle.com>
Subject: Re: [PATCH v4 1/3] kbuild: add mod(name,file)_flags to assembler
 flags for module objects
Message-ID: <20240614134651.4ed2091d@rorschach.local.home>
In-Reply-To: <20240614171428.968174-2-kris.van.hees@oracle.com>
References: <20240614171428.968174-1-kris.van.hees@oracle.com>
	<20240614171428.968174-2-kris.van.hees@oracle.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 14 Jun 2024 13:14:26 -0400
Kris Van Hees <kris.van.hees@oracle.com> wrote:

> Module objects compiled from C source can be identified by the presence
> of -DKBUILD_MODFILE and -DKBUILD_MODNAME on their compile command lines.
> However, module objects from assembler source do not have this defines.
> 
> Add $(modfile_flags) to modkern_aflags (similar to modkern_cflahs), and
> add $(modname_flags) to a_flags (similar to c_flags).

You explain what this does but not why it does it.

-- Steve

