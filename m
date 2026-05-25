Return-Path: <linux-kbuild+bounces-13321-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YHrDL6QCFGquIQcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13321-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 10:04:52 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 283F65C76A6
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 10:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 91F45300D726
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2026 08:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D306A3D9DCF;
	Mon, 25 May 2026 08:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="mhYOt+f5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDAE3D9020;
	Mon, 25 May 2026 08:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779696289; cv=none; b=K2MtstafwGPQHBptyqKU5ro6alw+yEWRpnvGb6e/U4z3K5WeOnh1iBEDEVn3ab1AtxNmACrOpQQAayFs6ER7caeS5pHMvha0Hw6lrSgVEuJenyX2kOJmHDZZk/A9z7JztuwUqLrXILdTCAE+1WaPXPVBbHeNeM3STPdGlenM0Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779696289; c=relaxed/simple;
	bh=UNF96M+UDCAZMp95O/JWzkeXxV2VuNOkNZ2czONssQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Tjk5FwI4O1i21idAZxaGi9NfrKAZov4Bxf/BIj8ac3IFU/HH80f5FYnTNtuDC1NWezH8Mxe0nkCPcTx65m+lxCcW38IEX+H9shXT9O81iA1SIKxZdWX9LMqZpTEVrMY0Wkntik7jr+smplKYzav5BEWqFWM3Ahcejizuyv2Oh00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=mhYOt+f5; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1779696249;
	bh=GK0AcFW5IPbg97vLvTZXdLNFFCxbwYzKywtInr4XSUA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=mhYOt+f5fQB1YC7zGNhciEa2ldR7+bt7wuCnvO6dxBjRwK12fXVhcV975DWR+WF3Q
	 VPBxeZ7fGtDxVEAduW1JzQrebwRRSWm15uKDpI3N9y+9aZzBUhy8YgtyFcgSSAAQJ/
	 /KRRmAt2wGVk8/vjLvVuVuUrGgoM5sdiXHAKJxio=
X-QQ-mid: esmtpgz16t1779696231t7a118d65
X-QQ-Originating-IP: tglWTa7jp8/hh3inSZB9NJcQwm/bHefu53S7jS2DENM=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 25 May 2026 16:03:49 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2093867168644187205
EX-QQ-RecipientCnt: 6
From: Wentao Guan <guanwentao@uniontech.com>
To: petr.pavlu@suse.com
Cc: guanwentao@uniontech.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org,
	masahiroy@kernel.org
Subject: Re: [PATCH v2] genksyms: Support arm64 CRC32 hardware acceleration1~
Date: Mon, 25 May 2026 16:02:29 +0800
Message-Id: <20260525080229.1570905-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <5d1b8b13-d590-497d-9185-609494135348@suse.com>
References: <5d1b8b13-d590-497d-9185-609494135348@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWth7vBa++Gd2mL1dw9gWXuxo7KU172DoO2dvIIlgOwnEuR97Z471Sbp
	ZVkDWcApLRKgCZjPwJ2NgfoY6TT4YJKX3G27zIAqAtrV78OaR9nJEKef1MDjbyQ6f/mncmU
	7wJSy2ztJqD5el/i0fPKbAaBgZyuOwqyBc+e6ADXWIfJS+ll61Wh57Za7PvOfvYMebuP3XY
	bcxffHVQz0z+ImMJTfsbPrG2RsgOTFTVgHaRM7rD8V2z/DhKGnnIohVgcFmwnl64OEYUJ86
	21KNY+NPzNk+BOq6V6FSuFCV6LJlVqSoMOBsMu+YT0wWMqycvHBCos83dCP06z99vScwoml
	h5dAPUARIZMXJbjeComZ1aotfZOaYc2sFa+MQSiN0BccFcbXuEp79rHLaYc9PczDRF8uipu
	LFGSLQ7hCuwRaOxuFEKaWkRhB2j1eEBGnyVYgPtGLPDQNDTVHLQG2uoAAx18c2iQc+UAGPf
	CnZ/t+grz3oSCBNlnCRqwhCm/2O8CpZT+1tnXoZDzp8unPjeRCMF42MqXi2+Y3Vo3giN/n7
	5QskSAJuzUCxktJ8ByOCNfWAN2n8b/iM54hcMx8pTTbKNEm1PQnDcSWfhGq2dA8JbKU1J4J
	BXWQM9yFId0dP9FYIYTOaJmUFj0z0NQRCGOvr2T39Pii/95pR1emCN8ms01dHuolKI4I4W3
	Yg5e2JUcXEjzGY/+/2fGJkLPPMaaCOxBUwkWrQ+p0FLg99jn8C1/+tS8E/vTYjKkBSaQ263
	5WklsxXRvIA+b7txi4azc0lRolm10igHWZxCltXtuvOjUCsS7Zx1eFTpTkMHN4JsXS17f4r
	XPoGtIuKIzdobV7uC82ikcgOej3wcMvG2MxSPJ/RBI+oiwBdb1Io6kPN6r6xhgAWzoKrj/R
	sWhFyL1uICo12ZjWkgpcg8nPPBhMxdH3/GHCgH28j8jEVuoQLkLFeezVBKO9C3bchqtO23R
	8h4xBF5qUBvno4QKlu0lNz9JhUtNQ+blT89Fav7Sak4O8sG8IAQx0QD9OvW7XVB9ViXAScv
	serNid8kRf9uQAgjZtXnJNwcx0TI90RIDl+ZAfW6OupS1s/xdgqT5Z9bCyk2Cz0YsNFJJtY
	g==
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[uniontech.com,none];
	R_DKIM_ALLOW(-0.20)[uniontech.com:s=onoh2408];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13321-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[uniontech.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[guanwentao@uniontech.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[uniontech.com:mid,uniontech.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 283F65C76A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Petr,

Thanks for your reply,

> Could you please provide measurements showing how this improves the
> runtime of genksyms and affects the overall kernel build time? Are
From my build kernel workload, genksyms perf report (record -g -F 99) show:
without patch:
-  7.83% 0.00% genksyms genksyms [.] _start
   _start
 - __libc_start_main
   + 3.19% yylex
     1.81% find_symbol
     0.92% is_reserved_word
     0.62% free_list
   + 0.56% export_symbol

with patch:(find_symbol() and export_symbol() benifit from this):
-  7.12% 0.00% genksyms genksyms [.] _start
   _start
 - __libc_start_main
   - 3.01% yylex
       0.51% malloc
     1.65% find_symbol
     0.82% is_reserved_word
     0.50% free_list

> CRC calculations actually a hot path in genksyms? I don't think it is
> worth complicating the genksyms code with architecture-specific
> optimizations unless there is a clear benefit.
Right.

> Additionally, many distributions already switched to gendwarfksyms last
> year. Unless someone provides a good reason to keep genksyms around,
> I expect it will be deprecated soon and eventually removed. It would be
> more valuable to show whether the same optimization is worthwhile for
> gendwarfksyms.
I see gendwarfksyms use crc32 from <zlib.h>, which from zlib1g-dev and zlib1g.


BRs
Wentao Guan

