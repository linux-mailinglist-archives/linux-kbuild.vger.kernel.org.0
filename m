Return-Path: <linux-kbuild+bounces-265-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C5806405
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 02:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 71520B21072
	for <lists+linux-kbuild@lfdr.de>; Wed,  6 Dec 2023 01:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F9610F8;
	Wed,  6 Dec 2023 01:21:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7786E196;
	Tue,  5 Dec 2023 17:21:09 -0800 (PST)
X-QQ-mid: bizesmtp68t1701825652tqn6a9bj
Received: from localhost.localdomain ( [219.147.0.78])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 06 Dec 2023 09:20:49 +0800 (CST)
X-QQ-SSF: 01200000000000B0J000000A0000000
X-QQ-FEAT: /5D9664O2EUSvgP0XxT6g0eaGNcEG1H8I6GjK/tnLlRnh1xvWCndohvKG1n7j
	kjnnoHFErTEr7I9aeIskimiOkJk2VOMq+XwpfaDLhCVX9fLm0qgjUCclZypQBJoUPhVzgcM
	O6NZVg9E8qEMQHgXCLttrNTGlTYN/A0c4RQHNkH6l6txf3PMjya0CYYsSVQPX+g8s69H7jP
	IZFImoY/IjWWgsRMq93R9LGvdBpCASWN+VAajUXEb95jt/s3job82hab+iF1iX2cVM3u+Vy
	J8BFrWosr0j+S+KUxD6FUxSrffT2naQPBWVZ4+SDUbmXDsoa+lBoZWRsLw1e7WLICmpjMpE
	ErbQQYSsVrq3+JIoQD8teTNkxtWBQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13065259714944715131
From: Jialu Xu <xujialu@vimux.org>
To: nathan@kernel.org
Cc: justinstitt@google.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	masahiroy@kernel.org,
	morbo@google.com,
	ndesaulniers@google.com,
	xujialu@vimux.org
Subject: Re: [PATCH v2] gen_compile_commands.py: fix path resolve with symlinks in it
Date: Wed,  6 Dec 2023 09:20:34 +0800
Message-Id: <20231206012034.833057-1-xujialu@vimux.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231205165648.GA391810@dev-arch.thelio-3990X>
References: <20231205165648.GA391810@dev-arch.thelio-3990X>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:vimux.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Spam-Level: *

Hi Nathan,

>On Tue, Dec 05, 2023 at 10:15:26AM +0800, Jialu Xu wrote:
>> When symbolic links are involved in the path, os.path.abspath might not
>> resolve the symlinks and instead return the absolute path with the
>> symlinks intact.
>> 
>> Use pathlib.Path resolve() instead of os.path.abspath()
>> 
>> Signed-off-by: Jialu Xu <xujialu@vimux.org>
>
>Thanks for the clarification in your previous message [1], I suppose
>that makes sense as to why nobody has reported this to us because that
>is a rather odd situation that the upstream kernel would not experience.
>
>I think that some of those details should be in the commit message,
>along with a short example like you provided, so that we know exactly
>what the situation was and how this patch resolves it.
>
>Perhaps something like (please feel free to correct or reword as you
>feel necessary):
>
>"When a path contains relative symbolic links, os.path.abspath() might
>not follow the symlinks and instead return the absolute path with just
>the relative paths resolved, resulting in an incorrect path.
>
><broken example>
>
>Use pathlib.Path.resolve(), which resolves the symlinks and normalizes
>the paths correctly.
>
><working example>"
>
>The actual fix seems fine to me. Feel free to add
>
>  Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
>to the subsequent submission and please include both
>
>  Masahiro Yamada <masahiroy@kernel.org>
>  linux-kbuild@vger.kernel.org
>
>on it in addition to the people you have here, as he is the one who
>actually applies gen_compile_commands.py changes (I am going to send a
>MAINTAINERS change for this).
>
>[1]: https://lore.kernel.org/20231205021523.4152128-1-xujialu@vimux.org/
>

Thanks for the very detailed help!

Patch update as v3.

Cheers,
Jialu



