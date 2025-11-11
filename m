Return-Path: <linux-kbuild+bounces-9546-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7827C4B714
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 05:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C2F3B8F27
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Nov 2025 04:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDAD274B42;
	Tue, 11 Nov 2025 04:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VtN5Lhhz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CF726B2DA;
	Tue, 11 Nov 2025 04:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762834185; cv=none; b=UH8LdH7x3X9XxkokMDOHrBST/fu0ChPTiCXWUNe/Oy7CdIe7ahNZHGP3PEoKm21jW/TpJXR7Q54Jpumo3NZRpbj3X2kN8NiM9ss4l7nfMyZvO4HW1e7cfTc8TckMDH+tBCOzY8bwKj7VlsUJheUME7udGnX5X+MIqeJLMPOAtg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762834185; c=relaxed/simple;
	bh=TGrJAX0XhiTYIsGvgNqP2BImP+lI1gAINbaZ9M7kqgI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DgvG0+HsQC/zHrvXUsI4Ddphd1U/zw3iqzm4hIW/0C8JJfawVBZZzraMq/yscCh/+xY27xnQQekl68J3Yyasj11skrNlPfEFhpqKidg4aGLG53qEMgOZ2KKCu+4/yWppMnV5stfmeVOBpZMdtpsw5+vsQ02D9ST95oTmvg9eQv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qti.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VtN5Lhhz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qti.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AB3xNNp4073469;
	Tue, 11 Nov 2025 04:09:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/eGWzFw///P
	5Kqy7ng1qNBG12TA8mvVkKCJymgwKrAo=; b=VtN5LhhzzdsgnC9PgKh74KSXWS9
	bJRcs9k7wDiNCjEDdgW2fjccLlBFPaP2CHwbVspfo6kJKEqXhbYTqMnvAVRP7Fpt
	xWCxW5XSBFEPZor9QmTndaspB/bRrQxmN7DG2VvcMmnRtZEh6DI5F/uHpGqBqPiJ
	zYVVeNHbxiXdPTr/hBAfUB0HctoywtGosdnpjNWC3yiVRAPQ+BMWQqfnJSIBj/iM
	KRHrA9ehm24mnSocG/o6b/nWTawR6Hz75KS44Dn5FFIVBSZIngXMna10pvooOD06
	NCCnpCb0Q3bTFOnia9Ly3zUbSCvkAeFN6C+B9KbbjMvla5SM9YYIyxa73SQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abkws9k7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Nov 2025 04:09:27 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AB49QOK028400;
	Tue, 11 Nov 2025 04:09:26 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 4abqjgu8xc-1;
	Tue, 11 Nov 2025 04:09:26 +0000
Received: from NALASPPMTA04.qualcomm.com (NALASPPMTA04.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AB49PR1028392;
	Tue, 11 Nov 2025 04:09:25 GMT
Received: from hu-grahamr-lv.qualcomm.com (hu-grahamr-lv.qualcomm.com [10.81.26.100])
	by NALASPPMTA04.qualcomm.com (PPS) with ESMTP id 5AB49PjC028385;
	Tue, 11 Nov 2025 04:09:25 +0000
From: Graham Roff <grahamr@qti.qualcomm.com>
To: rdunlap@infradead.org
Cc: corbet@lwn.net, grahamr@qti.qualcomm.com, jani.nikula@linux.intel.com,
        linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, nathan@kernel.org, nico@fluxnic.net,
        nsc@kernel.org
Subject: Re: [PATCH] Support conditional deps using "depends on X if Y"
Date: Mon, 10 Nov 2025 20:09:25 -0800
Message-Id: <20251111040925.2535085-1-grahamr@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <e355cd63-77cd-42ac-b852-c789ee8c8869@infradead.org>
References: <e355cd63-77cd-42ac-b852-c789ee8c8869@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTExMDAyOCBTYWx0ZWRfXxHMprISBiGit
 KVSIDYbq1tNdKkBDx2oIiSPY51srxWOiUX2HhRHuAy6U5D6oo0I4Vdh0nvP5gI3ZVrS6gUhEBku
 n7HkuUCMzGUo8vPTZCQsrHqT71MbdXxXgxMyy9Yo8X+nau4WEQJQaf9UGhxMsTrmTa+FXbj86mY
 II5E8DhUy/M2MFvTeb3IkHEOtgVOG5b4TeyWVIMx1T6K9fzClEssZI9XBTAprbdPFzgUA9b+PIs
 cQHVrBnNYUfjss46O+lcj+TXALJE1j0gWBQfuL3zRtn/Dwotk5QjiEFjxSajkdD7QApztT4VXWN
 D9fCy+/UmeAt0PW2/3St64vC5PYOJueSdPfcWCzrNQbSe1A6e4EHpyCUay2wY0W9NdooY/JI23g
 z/0wYelrJcj5QBai4RGV1b8mw3uvtw==
X-Authority-Analysis: v=2.4 cv=Vosuwu2n c=1 sm=1 tr=0 ts=6912b6f7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=q0gqmUp0XkS3dxuJLy4A:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: dRwbiAgsD_NSfOq5A4rDRk8Hn53tZGt8
X-Proofpoint-ORIG-GUID: dRwbiAgsD_NSfOq5A4rDRk8Hn53tZGt8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-11_01,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511110028

> On 11/10/25 1:15 PM, Nathan Chancellor wrote:
> > Support for this change has been expressed by a number of developers 
> > since the original patch was proposed back in 2020, and has recently 
> > also been raised as a patch to the Zephyr kconfig system.
> 
> Do you have a link to this Zephyr Kconfig change?

Link: https://github.com/zephyrproject-rtos/Kconfiglib/pull/21

> > On Mon, Nov 10, 2025 at 10:48:59AM +0200, Jani Nikula wrote:
> >> "depends on A || !A" (or A=n) is the most common pattern in Kconfig,
> >> which literally means "depends on A if A".
> > 
> > That is totally fair, I did not try to actually search for the idiom. I
> > will say I do not find that either expression in Kconfig easily
> > translates in my head to "this dependency must be built in if the symbol
> > is built in, modular if the symbol is modular, or disabled" but I guess
> > that is just lack of familiarity with these idioms. I just want it to be
> > obvious to folks writing Kconfig when something like this is appropriate
> > to use but I guess with that being the most common usage in the tree, it
> > is fine as is.
> 
> I haven't tested it but it looks reasonable to me.

I will update the documentation to make the initial example
more understandable ("depends on A if B" is actually easier to follow 
than the more strange "depends on A if A"). Then also add a note in the
section on Optional Dependencies about using the new "A if A" form.

> 
> > I think my point about tests still stands, at least something very
> > basic.
> 
> Ack.

Agree, will include tests in the updated patch.

Graham 


